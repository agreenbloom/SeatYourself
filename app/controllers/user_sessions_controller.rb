class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(restaurants_path, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(restaurants_path, notice: 'Logged out!')
  end
end
