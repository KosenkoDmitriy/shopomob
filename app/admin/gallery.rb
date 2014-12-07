ActiveAdmin.register Gallery do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :url, :image, images_attributes: [:id, :image, :_destroy], translations_attributes: [:id, :locale, :title]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form do |f|
    #f.inputs
    f.translated_inputs I18n.t("gallery"), switch_locale: false do |f|
      f.input :title, :label => 'title'
    end

    f.inputs I18n.t("images") do
      f.input :url, :label => 'gallery url/website'

      f.has_many :images, :heading => 'Images' do |ff|
        ff.input :image, :label => "Image", :hint => ff.template.image_tag(ff.object.image.url(:thumb))
        ff.input :_destroy, :as=>:boolean, :required => false, :label => I18n.t('remove')
      end
    end

    f.actions
  end

end
