class PasswordResetsController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find_by(id: current_user.id)

    if user&.authenticate(reset_params[:password]) && reset_params[:reset] == reset_params[:reset_confirmation]
      user.update(password: reset_params[:reset])
      logger.debug(user.inspect);
      redirect_to user_path, notice: "パスワードを変更しました！"
    else
      logger.debug('失敗');
      logger.debug(user.inspect);
      render template: "password_resets/edit"
    end
  end

  private

  def reset_params
    params.require(:password_reset).permit(:password, :reset, :reset_confirmation)
  end

end
