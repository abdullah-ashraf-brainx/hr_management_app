class HiringPositionsController < ApplicationController
  before_action :set_hiring_position, only: %i[ show edit update destroy ]
  before_action :authenticate_admin_user!


  def index
    @hiring_positions = HiringPosition.all
  end

  def show
  end

  def new
    @hiring_position = HiringPosition.new
  end

  def edit
  end

  def create
    @hiring_position = HiringPosition.new(hiring_position_params)

    respond_to do |format|
      if @hiring_position.save
        format.html { redirect_to hiring_positions_path, alert: "Hiring position was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hiring_position.update(hiring_position_params)
        format.html { redirect_to hiring_positions_path, alert: "Hiring position was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hiring_position.destroy

    respond_to do |format|
      format.html { redirect_to hiring_positions_url, alert: "Hiring position was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_hiring_position
      @hiring_position = HiringPosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hiring_position_params
      params.require(:hiring_position).permit(:title, :details, :location, :hiring_image)
    end
end
