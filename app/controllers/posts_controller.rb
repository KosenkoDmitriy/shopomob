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

    @page_title       = @post.seo.meta_title if @post.seo.present?
    @page_description = @post.seo.meta_description if @post.seo.present?
    @page_keywords    = @post.seo.meta_keywords if @post.seo.present?
  end
end
