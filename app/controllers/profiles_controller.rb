class ProfilesController < ApplicationController
  def show
    @user_transportations = Transportation.where(user: current_user)
    @user_reservations = Reservation.where(user: current_user)
    authorize @user_transportations
  end
end
