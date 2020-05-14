class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(params_filter)

    if @post.save
      redirect_to root_path
    else
      render new
    end

  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  private

  def params_filter
    params.require(:post).permit(:title, :body)
  end
end
