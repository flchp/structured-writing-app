class Foreground::PostsController < ApplicationController

  def index
    @posts = Post.is_public.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

end
