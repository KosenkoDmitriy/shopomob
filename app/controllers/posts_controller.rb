class PostsController < ApplicationController
  theme :theme_resolver
  before_action :set_locale

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

  def theme_resolver
    params[:theme].presence || 'stylish2'
  end
  def set_locale
    I18n.locale = params[:locale] || "ru" #I18n.default_locale #TODO:
  end
end
