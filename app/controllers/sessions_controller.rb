class SessionsController < ApplicationController

  def login
  end

  def process_login
    username = params[:username]
    @user = User.find_by(username: username)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Seja bem vindo, #{@user.username}!"
      redirect_to user_path(@user.id)
    else
      redirect_to login_path
    end
  end
  
  def logout
    session.clear
    redirect_to login_path
  end
end
