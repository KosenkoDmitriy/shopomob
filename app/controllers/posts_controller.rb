class PostsController < ApplicationController
  theme :theme_resolver
  before_action :set_locale

  add_breadcrumb "Главная", :root_path
  add_breadcrumb "Статьи", :posts_path

  def index
    page = params[:page].present? ? params[:page] : 1
    @posts = Post.all.paginate(:page => page, :per_page => 10)
    @post = @posts.first

    add_breadcrumb "Все", posts_path
  end

  def show
    page = params[:page].present? ? params[:page] : 1
    @posts = Post.all.paginate(:page => page, :per_page => 10)
    @post = Post.find(params[:id])

    @page_title       = @post.seo.meta_title if @post.seo.present?
    @page_description = @post.seo.meta_description if @post.seo.present?
    @page_keywords    = @post.seo.meta_keywords if @post.seo.present?

    add_breadcrumb @post.title, post_path
  end

  def theme_resolver
    params[:theme].presence || 'sm'
  end
  def set_locale
    I18n.locale = params[:locale] || "ru" #I18n.default_locale #TODO:
  end
end
