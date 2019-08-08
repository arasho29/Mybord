class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to :root, alert: 'User not found'
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path , notice: 'ユーザー登録しました'
      logger.debug(@user.inspect)
    else
      render :new
      logger.debug('失敗')
      logger.debug(@user.inspect)
    end
  end

  def show
   @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: 'ユーザー情報を更新しました！'
      logger.debug(@user.inspect)
    else
      render :edit
      logger.debug('失敗')
      logger.debug(@user.inspect)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :mail, :password, :password_confirmation, :introduce)
  end

end
