class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :image, :styles => { :slider=>"1674x550!", :slider_small => "370x193\!", :normal =>"640x640", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/home/adec_logo.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def image_url_thumb
    image.url(:thumb)
  end
  def image_url
    image.url(:medium)
  end
  def image_url_original
    image.url(:original)
  end
  def image_url_slider
    image.url(:slider)
  end

end
