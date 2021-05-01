class PagesController < ApplicationController
  def home
  end

  def dashboard
    @outfits = current_user.outfits
    @reservations = Reservation.find_by(user_id: current_user)


    # @pending_reservations = Reservation.pendings.where(user: @user)
    # @validated_reservations = Reservation.validated.where(user: @user)
    # @canceled_reservations = Reservation.canceled.where(user: @user)
  end
end
