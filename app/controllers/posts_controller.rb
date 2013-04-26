class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end
  def index
    @user = current_user
    @posts = @user.posts
  end
end
