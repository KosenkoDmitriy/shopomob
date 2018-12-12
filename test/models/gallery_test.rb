require 'test_helper'

class GalleryTest < ActiveSupport::TestCase
  test "gallery should contains some projects" do
    gallery = Gallery.create(title: 'Gallery')

    gallery.projects << Project.create(title: 'Project 1')
    gallery.projects << Project.create(title: 'Project 2', is_draft: true)

    assert_equal(2, gallery.projects.count)
    assert_equal(1, gallery.projects.where(is_draft: true).count)
  end
end
