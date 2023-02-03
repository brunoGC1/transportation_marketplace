class TransportationsController < ApplicationController
  def index
    @transportations = policy_scope(Transportation)
  end

  def show
    @transportation = Transportation.find(params[:id])
    authorize @transportation
  end

  def new
    @transportation = Transportation.new
    authorize @transportation
  end

  def create
    # @transportation = Transportation.new(transportation_params)
    # if @transportation.save
    #   redirect_to @transportation, notice: "Transportation was successfully created"
    # else
    #   render :new, status: :unprocessable_entity
    # end
    @transportation = Transportation.new(transportation_params)
    @transportation.save
    redirect_to transportations_path
    authorize @transportation
  end

  def edit
    @transportation = Transportation.find(params[:id])
    authorize @transportation
  end

  def update
    @transportation = Transportation.find(params[:id])
    @transportation.update(transportation_params)
    redirect_to Transportation.find(params[:id])
    authorize @transportation
  end

  def destroy
    @transportation = Transportation.find(params[:id])
    @transportation.destroy
    redirect_to transportations_path
    authorize @transportation
  end

  private

  def transportation_params
    params.require(:transportation).permit(:brand, :brand_model, :price, :user_id)
  end
end
