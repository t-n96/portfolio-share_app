class PostsController < ApplicationController
  before_action :login_check, {only: [:show]}
  def index
    @posts = Post.published.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def index_all
    @posts = Post.published.page(params[:page]).per(5)
  end

  def all_posts
    @posts = Post.published.all
  end

  def new
    @post = Post.new
  end

  def favorites_all
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def confirm
    @post = Post.new(post_params)
    if @post.invalid?
      redirect_to new_post_path, alert: '入力漏れがあります。お手数ですが、入力内容をご確認のうえ再度お試しください。'
    end
  end

  def draft
    @posts = current_user.posts.draft
  end

  def create
    @post = Post.new(post_params)
    if params[:back] || !@post.save
      render :new and return

    elsif params[:post][:status] == 'draft'
      flash[:notice] = "下書き保存しました。"
      redirect_to draft_posts_path

    else params[:post][:status] == 'published'
      flash[:notice] = "投稿を完了しました。"
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments
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
    flash[:notice] = "削除が完了しました。"
    redirect_to posts_path
  end

  def basic
    @posts = Post.published.where(category:"basic").page(params[:page]).per(5)
  end

  def colorful
    @posts = Post.published.where(category:"colorful").page(params[:page]).per(5)
  end

  def feminine
    @posts = Post.published.where(category:"feminine").page(params[:page]).per(5)
  end

  def sneaker
    @posts = Post.published.where(category:"sneaker").page(params[:page]).per(5)
  end

  def stylish
    @posts = Post.published.where(category:"stylish").page(params[:page]).per(5)
  end

  def post_params
    params.require(:post).permit(:title, :introduction, :post_image, :post_image_cache, :category, :status).merge(user_id: current_user.id)
  end
end
