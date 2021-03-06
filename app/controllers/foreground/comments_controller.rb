class Foreground::CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    @comment.save

    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit( :content)
  end

end
