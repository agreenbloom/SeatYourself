class ReservationsController < ApplicationController
  before_filter :load_restaurant

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user
    #@restuaruant.not_full?

    if @reservation.save
      redirect_to restaurants_path, notice: 'Reservation Created Successfully'
    else
      render 'restaurants/show'
    end
  end

  def index
    @reservation = Reservation.all

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end


private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :Partysize)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end


