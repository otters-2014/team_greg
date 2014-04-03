class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # login
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      # fuck you
      render action: 'new'
    end
  end
end

