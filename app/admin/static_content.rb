ActiveAdmin.register StaticContent do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :subtitle, :text, :tags, :is_draft, translations_attributes: [:id, :locale, :title, :subtitle, :text, :tags]

  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.translated_inputs I18n.t("Static Contents"), switch_locale: true do |f|
      f.input :title
      f.input :subtitle
      f.input :text
      
    end
    f.inputs do
      f.input :tags
      f.input :is_draft
    end
    f.actions
  end

  index do
    actions

    column :id
    column :title
    column :subtitle
    column :tags
    column :is_draft

    actions
  end

end
