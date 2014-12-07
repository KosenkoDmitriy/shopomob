ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  controller do

    def new
      @post = Post.new
      @post.build_seo
    end

    def edit
      @post = Post.find(params[:id])
      if @post.seo_id.nil?
        @post.build_seo
      end
    end

    def update
      @post = Post.find(params['id'])
      if @post.seo.nil?
        @post.build_seo
      end
      @post.update_attributes(post_params)
      #@post.seo.update_attributes(post_params["seo_attributes"])
      #@post.seo.meta_title = "sdfa"
      #@post.seo.meta_description =post_params["seo_attributes"]["meta_description"]
      if @post.save
        redirect_to action: "index"
      else
        render "edit"
      end
    end

    def create
      @post = Post.new (post_params)
      if @post.save
        redirect_to action: "index"
      else
        render "new"
      end
    end

      private
    def post_params
      params.require(:post).permit(:id, :slug, :title, :text, :stext, :tags, :image, images_attributes: [:id, :image, :_destroy], post_categories_attributes: [:id, :title, :_destroy], seo_attributes: [:id, :meta_title, :meta_description, :meta_keywords, :_destroy], translations_attributes: [:id, :locale, :slug, :title, :text, :stext, :tags])
    end
  end

  #permit_params :slug, :title, :text, :stext, :tags, :image, images_attributes: [:id, :image, :_destroy], post_categories_attributes: [:id, :title, :_destroy], seo_attributes: [:id, :meta_title, :meta_description, :meta_keywords, :_destroy], translations_attributes: [:id, :locale, :slug, :title, :text, :stext, :tags]

  index do
    column :id
    column :title
    column :stext
    translation_status
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    #f.inputs I18n.t("company.label") do
    #  f.input :title
    #  f.input :slug
    #  f.input :stext
    #  f.input :text
    #  f.input :tags
    #end
    f.translated_inputs I18n.t("company.label"), switch_locale: false do |f|
      f.input :title
      f.input :slug
      f.input :stext
      f.input :text
      f.input :tags
    end
    f.inputs I18n.t("images") do
      f.has_many :images, :heading => 'Images' do |ff|
        ff.input :image, :label => "Image", :hint => ff.template.image_tag(ff.object.image.url(:thumb))
        ff.input :_destroy, :as=>:boolean, :required => false, :label => I18n.t('remove')
      end
    end
    f.inputs I18n.t("post_category") do
      f.has_many :post_categories, :heading => 'post_categories' do |ff|
        ff.input :title, :label => "Title"
        ff.input :_destroy, :as=>:boolean, :required => false, :label => I18n.t('remove')
      end
    end

    f.inputs I18n.t("seo") do  # Настройка полей SEO
      #f.semantic_fields_for :seo_attributes do |j|
        f.semantic_fields_for :seo do |j|
        j.inputs :meta_title, :meta_keywords, :meta_description
      end
    end
    f.actions
  end
end
