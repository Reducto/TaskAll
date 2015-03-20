class PostsController < ApplicationController
	
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc).includes(:author)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @author = Author.find_by(id: @post.author_id)
    @comments = Comment.where(post_id: params[:id])
  end
end
