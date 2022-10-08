class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    if @post.invalid?
      redirect_to new_post_path, notice: '入力に誤りがあります。'
    end
  end

  def create
    @post = Post.new(post_params)
    if params[:back] || !@post.save
      render :new and return
    end
    flash[:notice] = "投稿完了しました。"
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :introduction, :post_image, :post_image_cache)
  end
end
