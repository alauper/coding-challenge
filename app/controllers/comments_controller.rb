class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.order(created_at: :desc)
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def update
    @comment.update_attributes!(comment_params)
  end

  def destroy
    @comment.destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end
end
