class PostsController < ApplicationController
  before_action :find_post, only: [:show, :destroy]

  def index
    @query = params[:query]
    @posts = Post.search(@query).order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post was successfully removed.'
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:body, :title)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
