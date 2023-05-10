class HiringPositionsController < ApplicationController
  before_action :set_hiring_position, only: %i[ edit update destroy ]

  def index
    @hiring_positions = HiringPosition.all
  end

  def new
    @hiring_position = HiringPosition.new
  end

  def edit
  end

  def create
    @hiring_position = HiringPosition.new(hiring_position_params)

    if @hiring_position.save
      redirect_to hiring_positions_path, notice: "Hiring position was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update

    if @hiring_position.update(hiring_position_params)
      redirect_to hiring_positions_path, notice: "Hiring position was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    if @hiring_position.destroy
      redirect_to hiring_positions_url, notice: "Hiring position was successfully destroyed."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_hiring_position
      @hiring_position = HiringPosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hiring_position_params
      params.require(:hiring_position).permit(:title, :details, :location, :poster_image)
    end
end
