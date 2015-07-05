class CategoriesController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
