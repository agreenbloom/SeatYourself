class RestaurantsController < ApplicationController

  def index

    @restaurants = if params[:search]
      Restaurant.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
      Restaurant.near(params[:search], 1, units: :km)
    elsif params[:longitude] && params[:latitude]
      Restaurant.near([params[:latitude], params[:longitude]], 1, units: :km)
    else
      Restaurant.all
    end

    respond_to do |format|
      format.html
      format.js
      format.json do
        # render json: @restaurants.map { |r|
        #   {
        #     id: r.id;
        #     name: r.name;
        #   }
        # }
      end
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @nearby_restaurants = @restaurant.nearbys(1, units: :km)

    if current_user
      @reservation = @restaurant.reservations.build
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:party_size, :category_id, :location, :capacity, :address)
  end
end
