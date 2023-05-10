class CandidatesController < ApplicationController
  before_action :set_hiring_position

  def index
    @candidates = @hiring_position.candidates
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
    # @candidate.destroy

    if @candidate.destroy
      redirect_to hiring_position_candidates_path, notice: "Candidate was successfully destroyed."
    else
      render :new, status: :unprocessable_entity
    end
  
  end

  private
    def set_hiring_position
      @hiring_position = HiringPosition.find(params[:hiring_position_id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:name, :email, :phone, :university, :experience, :cv)
    end
end
