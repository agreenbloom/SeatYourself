class CategoriesController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])

      if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
  end
end
