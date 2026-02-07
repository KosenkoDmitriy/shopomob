class ProjectsController < ApplicationController
  add_breadcrumb I18n.t("menu.main").upcase, :root_path
  add_breadcrumb I18n.t('menu.projects').upcase, "/#{I18n.locale}/#projects"

  def show
    page = params[:page].present? ? params[:page] : 1
    @projects = Project.where(is_draft: false).order(id: :desc).paginate(page: page, per_page: 10)
    @project = Project.find(params[:id])
    add_breadcrumb @project.title, project_path
  end
end
