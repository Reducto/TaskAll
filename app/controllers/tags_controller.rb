class TagsController < ApplicationController
  def search
  	@posts = Tag.find_by(id: params[:id]).posts.paginate(:page => params[:page], :per_page => 10)
    @tag = Tag.find_by(id: params[:id])
  end
end
