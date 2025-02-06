ActiveAdmin.register Teamer do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :secondname, :firstname, :text, image_attributes: [:id, :image, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form do |f|
    f.inputs

    f.inputs "Images" do
      f.has_many :image, :heading => 'Images' do |ff|
        ff.input :image, :label => "Image", :hint => ff.template.image_tag(ff.object.image.url(:thumb))
        ff.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
      end
    end
    f.actions
  end

end
