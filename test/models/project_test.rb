require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'project should contains some galleries' do
    project = Project.create(title: 'Project 1')
    gallery = Gallery.create(title: 'Gallery 1')
    gallery2 = Gallery.create(title: 'Gallery 2')
    project.galleries = gallery, gallery2
    project.save
    assert_equal(project.galleries.count, 2)
  end
  test 'draft project is not visible in frontend' do
    Project.create(title: 'Project is not visible', is_draft: true)
    Project.create(title: 'Project is visible')
    assert_equal(Project.where(is_draft: true).count, 1)
  end
end
