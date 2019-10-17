class TagsController < ApplicationController
  before_action :find_post, only: [:index, :create]

  def index
  end

  def create
    @tagging = @post.add_tag(params[:tag_name])
  end

  def destroy
    @tagging = Tagging.find(params[:id]).destroy
  end

  private

    def post_params
      params.require(:post).permit(:body, :title)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end
end
