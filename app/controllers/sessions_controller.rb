class SessionsController < ApplicationController
  def new

  end

  def create
    if @user = User.find_by_email(params[:email])
      if @user.authenticate params[:password]
        session[:user_id] = @user.id
        flash[:success] = "Logged in!"
        redirect_to root_path
      else
        flash[:error] = "Wrong password!"
        redirect_to 'new'
      end
    else
      flash[:error] = "Cannot find user!"
      redirect_to 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out!"
    redirect_to root_path
  end
end
