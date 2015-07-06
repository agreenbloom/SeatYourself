class WelcomeController < ApplicationController
  def index
  @restaurants = Restaurant.limit(10)
  @categories = Category.all
  end
end
