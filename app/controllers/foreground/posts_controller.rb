class Foreground::PostsController < ApplicationController

  def index
    @posts = Post.is_public.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])

    @comment = Comment.new
    @comments = @post.comments.order("created_at DESC")
  end

  def like
    @post = Post.find(params[:id])
    unless @post.find_like(current_user)  # 如果已经按讚过了，就略过不再新增
      Like.create( :user => current_user, :post => @post)
    end

    redirect_back(fallback_location: root_path)
  end

  def quit_like
    @post = Post.find(params[:id])
    like = @post.find_like(current_user)
    like.destroy

    redirect_back(fallback_location: root_path)
  end

end
