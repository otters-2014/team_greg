class KbombsController < ApplicationController

  def index
    @kbombs = Kbomb.all
    @user = User.find_by_id(params[:id])
  end

  def show
    @kbomb = Kbomb.find(params[:id])
  end

  def create
    @user = User.find(session[:user_id])
    @user.kbombs << Kbomb.find(params[:kbomb_id])

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(session[:user_id])
    @kbomb = Kbomb.find(params[:id])

    @user.kbombs.destroy(@kbomb)

    redirect_to user_path(@user)
  end

end
