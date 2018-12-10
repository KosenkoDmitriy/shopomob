ActiveAdmin.register Service do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :is_visible, :title, :text, :stext, :price, :link, :image, image_attributes: [:id, :image, :_destroy], translations_attributes: [:id, :locale, :link, :title, :text, :stext, :price]
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

    f.translated_inputs I18n.t("services"), switch_locale: false do |f|
      f.input :title
      f.input :stext
      f.input :text
      f.input :link
      f.input :price
    end

    f.inputs "Images" do
      f.has_many :image, :heading => 'Images' do |ff|
        ff.input :image, :label => "Image", :hint => ff.template.image_tag(ff.object.image.url(:thumb))
        ff.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
      end
    end

    f.input :is_visible

    f.actions
  end

  index do
    #actions
    column :id
    column :image do |ad|
      image_tag ad.try(:image).try(:image).try(:url, :thumb)
    end
    column :title
    column :stext
    column :price
    column :link
    column :is_visible
    #columns
    actions
  end

end
