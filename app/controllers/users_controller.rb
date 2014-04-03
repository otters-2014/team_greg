class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    user.description = ""
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:signup).permit(:email, :first_name, :last_name, :password,
      :password_confirmation)
  end
end
