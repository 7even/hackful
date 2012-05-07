class SearchController < ApplicationController
  def index
    @posts = Post.search(params[:s])
    @users = User.search(name: params[:s])
    @comments = Comment.search(text: params[:s])
  end
end