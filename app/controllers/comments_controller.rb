class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @article, status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
