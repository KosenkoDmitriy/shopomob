class StaticContent < ActiveRecord::Base
  translates :title, :subtitle, :text, :tags
  active_admin_translates :title, :subtitle, :text, :tags

end
