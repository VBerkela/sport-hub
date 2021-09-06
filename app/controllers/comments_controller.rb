class CommentsController < ApplicationController
  respond_to :js, :html, :json
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    if @comment.save
      CommentMailer.new_comment_email(@comment, current_user).deliver_now
      redirect_to @article
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @article
  end

  def vote
    @comment = Comment.find(params[:id])
    if !current_user.liked? @comment
      @comment.liked_by current_user
    elsif current_user.liked? @comment
      @comment.unliked_by current_user
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
