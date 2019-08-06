class PostsController < ApplicationController
  before_action :login_required
  PER = 10

def index
  @posts  = Post.page(params[:page]).per(PER).order(created_at: :desc)
end

def new
  @post = current_user.posts.new(user_id: @current_user.id)
end

def create
  @post = current_user.posts.new(post_params)
  if @post.save
    redirect_to posts_path
    logger.debug(@post.inspect)
  else
    render :new
    logger.debug('失敗')
  end
end

def destroy
  post = current_user.posts.find(params[:id])
  post.destroy
  redirect_to user_path(current_user.id)
end

def show
  @post = Post.find_by(id: params[:id])
  @user = User.find_by(id: @post.user_id)
end


private
def post_params
  params.require(:post).permit(:name, :mail, :message)
end

def login_required
  redirect_to login_path unless current_user
end


end
