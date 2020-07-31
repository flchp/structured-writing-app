class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      if @post.post_model
        redirect_to edit_account_post_path(@post)
      else
        redirect_to account_posts_path
      end
    else
      render :new
    end
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
      flash[:notice] = "post updated"
      redirect_to account_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "post deleted"
    redirect_back(fallback_location: root_path)
  end

  def set_private
    @post = Post.find(params[:id])
    @post.set_is_private = true
    @post.save
    redirect_back(fallback_location: root_path)
  end

  def set_public
    @post = Post.find(params[:id])
    @post.set_is_private = false
    @post.save
    redirect_back(fallback_location: root_path)
  end

  def set_model
    @post = Post.find(params[:id])
    @post.set_is_model = true
    @post.save
    redirect_back(fallback_location: root_path)
  end

  def quit_set_model
    @post = Post.find(params[:id])
    @post.set_is_model = false
    @post.save
    redirect_back(fallback_location: root_path)
  end

  def select_model_new
    @post = Post.new
    @my_post_models = current_user.posts.is_model
  end

  def like_posts_index
    @posts = current_user.liked_posts.order("created_at DESC")
  end

  def quit_like
    @post = Post.find(params[:id])
    like = @post.find_like(current_user)
    like.destroy

    redirect_back(fallback_location: root_path)
  end



  private

  def post_params
    params.require(:post).permit(:title, :content, :set_is_private, :set_is_model,
                                 :post_model_id, :category_ids => [])
  end
end
