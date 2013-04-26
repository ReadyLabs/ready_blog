class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(params[:post])
    your_face = root_path
    redirect_to your_face
  end
  def index
  end
end
