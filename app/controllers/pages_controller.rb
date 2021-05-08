class PagesController < ApplicationController
  def home
  end

  def dashboard
    @outfits = current_user.outfits
    @my_reservations = current_user.reservations
    @received_reservations = @outfits.map do |outfit|
      outfit.reservations
    end.flatten
    @my_pending_reservations = Reservation.pendings.where(user: current_user)
    @my_validated_reservations = Reservation.validated.where(user: current_user)

    @my_received_pending_reservations = current_user.pendings
    @my_received_validated_reservations = current_user.validated
  end
end
