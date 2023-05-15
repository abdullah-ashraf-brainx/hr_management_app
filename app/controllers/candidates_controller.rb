require 'csv'

class CandidatesController < ApplicationController
  before_action :set_hiring_position

  def index
    @candidates = @hiring_position.candidates
    respond_to do |format|
      format.html 
      format.csv do
        send_data to_csv, filename: "Candidates-#{@hiring_position.title}.csv"
      end
    end
  end

  def show
    @candidate = @hiring_position.candidates.find(params[:id])
  end

  def new
    @candidate = @hiring_position.candidates.build
  end

  def create
    @candidate = @hiring_position.candidates.build(candidate_params)

    if @candidate.save
      redirect_to hiring_position_candidates_path(@hiring_position), notice: "Candidate was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @candidate = @hiring_position.candidates.find(params[:id])

    if @candidate.destroy
      redirect_to hiring_position_candidates_path, notice: "Candidate was successfully destroyed."
    else
      render :new, status: :unprocessable_entity
    end

    
  end

  def export
  end

  def send_email
    @email = params[:email]
    @message = params[:message]
    
    CandidateMailer.with(email: @email, message: @message).send_email_to_candidate.deliver_now
    
    redirect_to hiring_position_candidates_path, notice: 'Email sent!'
  end

  private
    def set_hiring_position
      @hiring_position = HiringPosition.find(params[:hiring_position_id])
    end

    def to_csv
      attributes = %w{name email phone university experience}
      CSV.generate(headers: true) do |csv|
        csv << attributes
  
        @candidates.each do |candidate|
          csv << attributes.map {|attr| candidate.send(attr)}
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:name, :email, :phone, :university, :experience, :cv)
    end
end
