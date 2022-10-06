class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
  end

  def create
    @post = Post.new(post_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :introduction, :post_image)
  end
end
