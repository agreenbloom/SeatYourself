class ReservationsController < ApplicationController
  def create
    reservation = Reservation.new(reservation_params)
    reservation.save
  end

  def destroy
  end

  def update
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :table_id)
  end
end
