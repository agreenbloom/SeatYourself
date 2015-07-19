class ReservationsController < ApplicationController
  before_filter :load_restaurant

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
      @reservation.user = current_user

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Reservation Created Successfully' }
        format.js {}
      else
        format.html { render 'restaurants/show', notice: 'The time selected is unavailable' }
        format.js {}
      end
    end
  end

  def index
    @reservations = Reservation.all
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurants_path
  end


private
  def reservation_params
    params.require(:reservation).permit(:user_id, :date, :start_time, :party_size, :restaurant_id)

  end


  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
