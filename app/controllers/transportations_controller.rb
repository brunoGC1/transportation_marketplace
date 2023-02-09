class TransportationsController < ApplicationController
  # before_action :set_transportation, only: %i[new create]

  def index
    @transportations = policy_scope(Transportation)
  end

  def show
    @transportation = Transportation.find(params[:id])
    authorize @transportation
  end

  def new
    if current_user.blank?
      redirect_to new_user_session_path
    end
    @transportation = Transportation.new
    authorize @transportation
  end

  def create
    @transportation = Transportation.new(transportation_params)
    @transportation.user = current_user
    authorize @transportation
      if @transportation.save
        redirect_to transportation_path(@transportation), notice: "Transportation was successfully created"
      else
        render :new, status: :unprocessable_entity
      end

    # @transportation = Transportation.new(transportation_params)
    # @transportation.save
    # redirect_to transportations_path
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

  # def set_transportation
  #   @transportation = Transportation.find(params[:id])
  # end

  def transportation_params
    params.require(:transportation).permit(:brand, :brand_model, :price, :user_id, photos: [])
  end
end
