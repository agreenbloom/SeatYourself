class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @restaurants = Restaurant.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
