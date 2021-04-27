class ReservationsController < ApplicationController
    
      def index
        @reservations = Reservation.all
      end
    
    
      def new
        @reservation = Reservation.new
      end
    
      def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
          redirect_to reservation_path(@reservation)
        else
          render "new"
        end
      end


      def update 
        @reservation = Reservation.find(params[:edit])
        @reservation.update(reservation_params)
          redirect_to reservation_path(@reservation)
      end
    
      private
    
      def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :user_id, :outfit_id)
      end
end


