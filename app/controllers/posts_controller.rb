class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
        redirect_to new_post_path(@post)
    else
        render 'new_post'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
        redirect_to @post
    else
        render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def authorize
    redirect_to root_path, alert: 'Not authorized' unless can?(:crud)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
