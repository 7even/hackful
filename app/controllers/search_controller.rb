class SearchController < ApplicationController
  def index
    @posts = Post.search(params[:s])
  end
end