class AuthsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: auth_params[:username])

    if user&.authenticate(auth_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "ログインしました"
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "ログアウトしました"
  end

  private
  def auth_params
    params.require(:auth).permit(:username, :password)
  end

end
