class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.save
    @entry = @post.entry
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, :entry_id)
  end

end