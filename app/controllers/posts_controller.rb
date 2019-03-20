class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Uploading succesful" }
      else
        flash.now[:error] = 'Error uploading file'
        format.html { render 'new' }
      end
    end
  end

  def index
    @posts = Post.all
  end

  def show
  end

  private
  def post_params
    params.require(:post).permit(:post_file)
  end
end
