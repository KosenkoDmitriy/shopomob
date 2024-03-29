class Teamer < ActiveRecord::Base
  translates :firstname, :secondname, :text
  active_admin_translates :firstname, :secondname, :text do
    #validates_presence_of :firstname
  end

  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true
end
