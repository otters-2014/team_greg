class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:signup).permit(:email, :first_name, :last_name, :password,
      :password_confirmation)
  end

end
