class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end
end
