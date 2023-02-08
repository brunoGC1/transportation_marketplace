class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation)
  end

  def show
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def new
    @transportation = Transportation.find(params[:transportation_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @transportation = Transportation.find(params[:transportation_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.transportation = @transportation
    @reservation.total_price = @transportation.price * ((@reservation.end_date - @reservation.start_date) / 86_400).to_i
    @reservation.user = current_user
    @reservation.save
    redirect_to transportations_path
    authorize @reservation
  end

  def edit
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def update
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.update(reservation_params)

    redirect_to reservation_path(@reservation.id)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    redirect_to reservations_path
    authorize @reservation
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price)
  end
end
