class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    email    = params_session[:email]
    password = params_session[:password]

    if @user = login(email, password)
      redirect_to new_sessions_path
    else
      @user = User.new
      redirect_to new_sessions_path
    end
  end

  def destroy
    logout
    redirect_to new_sessions_path
  end

  private

  def params_session
    params.require(:user).permit(:email, :password)
  end
end
