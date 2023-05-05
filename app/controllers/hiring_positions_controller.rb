class HiringPositionsController < ApplicationController
  before_action :set_hiring_position, only: %i[ show edit update destroy ]
  before_action :authenticate_admin_user!

  # GET /hiring_positions or /hiring_positions.json
  def index
    @hiring_positions = HiringPosition.all
  end

  # GET /hiring_positions/1 or /hiring_positions/1.json
  def show
  end

  # GET /hiring_positions/new
  def new
    @hiring_position = HiringPosition.new
  end

  # GET /hiring_positions/1/edit
  def edit
  end

  # POST /hiring_positions or /hiring_positions.json
  def create
    @hiring_position = HiringPosition.new(hiring_position_params)

    respond_to do |format|
      if @hiring_position.save
        format.html { redirect_to hiring_position_url(@hiring_position), notice: "Hiring position was successfully created." }
        format.json { render :show, status: :created, location: @hiring_position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hiring_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hiring_positions/1 or /hiring_positions/1.json
  def update
    respond_to do |format|
      if @hiring_position.update(hiring_position_params)
        format.html { redirect_to hiring_position_url(@hiring_position), notice: "Hiring position was successfully updated." }
        format.json { render :show, status: :ok, location: @hiring_position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hiring_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hiring_positions/1 or /hiring_positions/1.json
  def destroy
    @hiring_position.destroy

    respond_to do |format|
      format.html { redirect_to hiring_positions_url, notice: "Hiring position was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hiring_position
      @hiring_position = HiringPosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hiring_position_params
      params.require(:hiring_position).permit(:title, :job_details, :location, :hiring_image)
    end
end
