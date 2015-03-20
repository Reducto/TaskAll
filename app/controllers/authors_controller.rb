class AuthorsController < ApplicationController
  def index
  	@authors = Author.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  	@author = Author.find_by(id: params[:id])
    @posts = Post.where(author_id: params[:id]).order(created_at: :desc).includes(:tags)
  end
end
