class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:login][:email])
    if user && user.authenticate(params[:login][:password])
      # login
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render action: 'new'
    end
  end
end

