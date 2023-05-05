class CandidatesController < ApplicationController
  before_action only: %i[ show edit update destroy ]
  before_action :get_hiring_position

  def index
    @candidates = @hiring_position.candidates
  end

  def show
    @hiring_position = HiringPosition.find(params[:hiring_position_id])
    @candidate = @hiring_position.candidates.find(params[:id])
  end

  def new
    @candidate = @hiring_position.candidates.build
  end

  def create
    @candidate = @hiring_position.candidates.build(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to hiring_position_candidates_path(@hiring_position), alert: "Candidate was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hiring_position = HiringPosition.find(params[:hiring_position_id])
    @candidate = @hiring_position.candidates.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to hiring_position_candidates_path, alert: "Candidate was successfully destroyed." }
    end
  end

  private
    def get_hiring_position
      @hiring_position = HiringPosition.find(params[:hiring_position_id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:name, :email, :phone, :university, :experience, :candidate_cv)
    end
end
