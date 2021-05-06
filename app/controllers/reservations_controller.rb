class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    authorize @reservations
  end

  def new
    @outfit = Outfit.find(params[:outfit_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @outfit = Outfit.find(params[:outfit_id])
    @reservation.outfit_id = @outfit.id
    @reservation.user_id = current_user.id
    authorize @reservation
    if @reservation.save
      redirect_to outfit_path(@outfit)
    else
      render "new"
    end
  end

  def update
    @reservation = Reservation.find(params[:edit])
    authorize @reservation
    @reservation.update(reservation_params)
    redirect_to outfit_path(@outfit)
  end

  def status
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.update(status: params[:status])
    redirect_to dashboard_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :outfit_id)
  end
end


