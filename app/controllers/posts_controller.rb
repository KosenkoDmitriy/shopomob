class PostsController < ApplicationController

  add_breadcrumb I18n.t("menu.main").upcase, :root_path
  add_breadcrumb I18n.t('menu.posts').upcase, :posts_path

  def index
    page = params[:page].present? ? params[:page] : 1
    @posts = Post.with_translations(I18n.locale).all.paginate(:page => page, :per_page => 10)
    @post = @posts.first

    add_breadcrumb I18n.t(:all).upcase, posts_path
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

end
