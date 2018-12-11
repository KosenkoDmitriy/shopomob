class GalleriesProjects < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :project
end
