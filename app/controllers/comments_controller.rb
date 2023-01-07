class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "コメントしました。"
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to request.referer
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
