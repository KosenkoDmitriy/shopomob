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

  permit_params :slug, :title, :text, :stext, :tags, :image, images_attributes: [:id, :image, :_destroy], post_categories_attributes: [:id, :title, :_destroy]

  form do |f|
    f.inputs
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

    f.actions
  end
end
