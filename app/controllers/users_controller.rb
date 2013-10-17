class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Added User Successfully!"
    else
      render 'new'
    end
  end
  
end
