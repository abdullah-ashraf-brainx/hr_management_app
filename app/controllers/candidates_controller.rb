class CandidatesController < ApplicationController
  # before_action :set_candidate, only: %i[ show edit update destroy ]
  before_action :get_hiring_position

  # GET /candidates or /candidates.json
  def index
    @candidates = @hiring_position.candidates
  end

  # GET /candidates/1 or /candidates/1.json
  def show
    @hiring_position = HiringPosition.find(params[:hiring_position_id])
    @candidate = @hiring_position.candidates.find(params[:id])
  end

  # GET /candidates/new
  def new
    @candidate = @hiring_position.candidates.build
  end

  # GET /candidates/1/edit
  # def edit
  # end

  # POST /candidates or /candidates.json
  def create
    @candidate = @hiring_position.candidates.build(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to hiring_position_candidates_path(@hiring_position), alert: "Candidate was successfully created." }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1 or /candidates/1.json
  # def update
  #   respond_to do |format|
  #     if @candidate.update(candidate_params)
  #       format.html { redirect_to hiring_position_candidate_path(@hiring_position), notice: "Candidate was successfully updated." }
  #       format.json { render :show, status: :ok, location: @candidate }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @candidate.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /candidates/1 or /candidates/1.json
  def destroy
    @hiring_position = HiringPosition.find(params[:hiring_position_id])
    @candidate = @hiring_position.candidates.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to hiring_position_candidates_path, alert: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_hiring_position
      @hiring_position = HiringPosition.find(params[:hiring_position_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    # def set_candidate
    #   @candidate = @hiring_position.candidates.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:name, :email, :phone, :university, :experience, :candidate_cv)
    end
end
