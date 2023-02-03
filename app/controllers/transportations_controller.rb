class TransportationsController < ApplicationController
  def index
    @transportations = policy_scope(Transportation)
  end

  def show
    @transportation = Transportation.find(params[:id])
  end

  def new
    @transportation = Transportation.new
  end

  def create
    @transportation = Transportation.new(transportation_params)
    if @transportation.save
      redirect_to @transportation, notice: "Transportation was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @transportation = Transportation.find(params[:id])
  end

  def update
    @transportation = Transportation.find(params[:id])
    @transportation.update(transportation_params)
    redirect_to Transportation.find(params[:id])
  end

  def destroy
    @transportation = Transportation.find(params[:id])
    @transportation.destroy
    redirect_to transportation_path
  end

  private

  def transportation_params
    params.require(:transportation).permit(:brand, :brand_model, :price)
  end
end
