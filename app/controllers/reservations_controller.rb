class ReservationsController < ApplicationController
  before_filter :load_restaurant
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
      @reservation.user = current_user
      #@restuaruant.not_full?

    if @reservation.save
      redirect_to restaurants_path, notice: 'Reservation Created Successfully'
    else
      render 'restaurants/show', notice: 'The time selected is unavailable'
    end
  end

  def index
    @reservation = Reservation.all
  end

  def new
    @restuaruant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to @restaurants
  end


private
  def reservation_params
    params.require(:reservation).permit(:user_id, :date, :start_time, :Partysize, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end


