class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    if @post.invalid?
      redirect_to new_post_path, notice: 'すべて入力・選択してください。'
    end
  end

  def create
    @post = Post.new(post_params)
    if params[:back] || !@post.save
      render :new and return
    end
    flash[:notice] = "投稿を完了しました。"
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    flash[:notice] = "投稿内容を更新しました。"
    redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:title, :introduction, :post_image, :post_image_cache).merge(user_id: current_user.id)
  end
end
