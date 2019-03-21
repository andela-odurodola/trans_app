class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_url, notice: "Uploading succesful" }
      else
        flash.now[:error] = 'Error uploading file'
        format.html { redirect_to root_url, alert: "Uploading failed" }
      end
    end
  end

  def index
    @posts = Post.with_attached_post_files
  end

  def show
  end

  private
  def post_params
    params.require(:post).permit(post_files: [])
  end
end
