class PostsController < ApplicationController
  
  def index
    page = params[:page].present? ? params[:page] : 1
    @posts = Post.all.paginate(:page => page, :per_page => 10)
    @post = @posts.first
  end

  def show
    page = params[:page].present? ? params[:page] : 1
    @posts = Post.all.paginate(:page => page, :per_page => 10)
    @post = Post.find(params[:id])
  end
end
