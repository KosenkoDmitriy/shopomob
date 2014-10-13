ActiveAdmin.register Image do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #


  permit_params :image, :title, :url
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  #controller do
  #  after_save :move
  #  private
  #    def move
  #      redirect_to({ action: 'index' }, alert: "Saved")
  #    end
  #end

  form html: { multipart: true }  do |f|
    f.inputs "image"  do
      f.input :title, :label => 'image name'
      f.input :url, :label => 'image url'

    end
    f.inputs "image url"  do
      f.file_field :image
      #f.input :url
      #  file_field_tag("image_attached_images_image", multiple: true, name: "images[attached_images_attributes][][image]")
    end

    f.actions

  end

  index do
    column :id
    column :image do |ad|
      image_tag ad.image.url(:thumb)
    end
    column :title
    column :url
    column :image_content_type
    column :image_file_name
    column :image_file_size
    column :image_updated_at

    #column :created_at
    #column :updated_at

    actions
  end

end
