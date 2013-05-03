class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def show
    @post = Post.find(params[:id])    
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
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def update
    @post = Post.find(params[:id])
    @post.published = params[:published] == "1"
    @post.save
    redirect_to user_posts_path(current_user)
  end
end
