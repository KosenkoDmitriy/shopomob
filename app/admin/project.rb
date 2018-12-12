ActiveAdmin.register Project do
  permit_params :title, :subtitle, :text, :tags, :url, :is_draft, images_attributes: [:id, :image, :_destroy], gallery_projects_attributes: [:id, :gallery_id, :project_id, :_destroy], galleries_attributes: [:id, :title, :_destroy], translations_attributes: [:id, :locale, :title, :subtitle, :text, :tags, :url]

  # controller do

  # #   def new
  # #     @project = Project.new
  # #     # @project.build_seo
  # #     # @project.galleries.build
  # #   end

  # #   def edit
  # #     @project = Project.find(params[:id])
  # #     # if @project.seo_id.nil?
  # #     #   @project.build_seo
  # #     # end
  # #     # if @project.galleries.count==0
  # #     #   @project.galleries.build
  # #     # end
  # #   end

  #   def update
  #     @project = Project.find(params['id'])
  #     # if @project.galleries.count==0
  #     #   @project.galleries.build
  #     # end
  #     @project.update_attributes(project_params.except(:galleries_attributes))
  #     # @project.galleries.each do |gallery|
    
  #     params["project"]["galleries_attributes"].map do |k,v|
  #       gid = v["id"].to_i
  #       is_delete = v["_destroy"].to_i == 1
  #       if is_delete
  #         # @project.galleries.find(gid).delete
  #         GalleryProject.where(project_id: @project.id, gallery_id: gid).delete
  #       else
  #         @project.galleries << Gallery.find(gid) if Gallery.exists?(gid)
  #       end
  #     end
    
  #     if @project.save
  #       redirect_to action: "index"
  #     else
  #       render "edit"
  #     end
  #   end

  #   def create
  #     @project = Project.new(project_params.except(:galleries_attributes))
  #     if @project.save
  #       params["project"]["galleries_attributes"].map do |k,v|
  #         @project.galleries << Gallery.find(v["id"].to_i) if v["_destroy"].to_i
  #       end
  #       redirect_to action: "index"
  #     else
  #       render "new"
  #     end
  #   end

  #   private
  #   def project_params
  #     params.require(:project).permit(:id, :title, :subtitle, :text, :tags, :url, :is_draft, images_attributes: [:id, :image, :_destroy], galleries_attributes: [:id, :title, :_destroy], translations_attributes: [:id, :locale, :title, :subtitle, :text, :tags, :url] ) #, seo_attributes: [:id, :meta_title, :meta_description, :meta_keywords, :_destroy])
  #   end
  # end

  form do |f|
    # f.inputs

    f.translated_inputs I18n.t("project"), switch_locale: true do |f|
      f.input :title #, :label => 'title'
      f.input :subtitle
      f.input :text
      f.input :tags
      f.input :url
    end

    f.inputs I18n.t("images") do
      # f.input :url, :label => 'gallery url/website'

      f.has_many :images, :heading => 'Images' do |ff|
        ff.input :image, :label => "Image", :hint => ff.template.image_tag(ff.object.image.url(:thumb))
        ff.input :_destroy, :as => :boolean, :required => false, :label => I18n.t('remove')
      end

      # f.has_many :galleries, :heading => 'Galleries', allow_destroy: false, new_record: true   do |ff|
      #   ff.input :id, :label => "Gallery", as: :select, collection: Gallery.all.map{|u| ["#{u.id}, #{u.title}", u.id]}
      #   # ff.input :id, label: "Gallery", as: :select, collection: Gallery.with_translations(I18n.locale).map{|u| ["#{u.id}, #{u.title}", u.id]}
      #   ff.input :_destroy, :as => :boolean, :required => false, :label => I18n.t('remove')
      # end

      f.has_many :gallery_projects, :heading => 'Galleries', allow_destroy: false, new_record: true   do |ff|
        ff.input :gallery_id, :label => "Gallery", as: :select, collection: Gallery.all.map{|u| ["#{u.id}) #{u.title}", u.id]}
        ff.input :_destroy, :as => :boolean, :required => false, :label => I18n.t('remove')
      end

      f.input :is_draft

    end

    f.actions
  end


  index do
    actions

    column :id
    column :images do |ad|
      # image_tag Image.first.image.url(:thumb)
      image_tag ad.try(:images).try(:first).try(:image).try(:url, :thumb)
    end
    column :title
    column :subtitle
    column :url
    column :tags
    column :is_draft
    # column :image_content_type
    # column :image_file_name
    # column :image_file_size
    # column :image_updated_at

    #column :created_at
    #column :updated_at

  end

end
