require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test 'should return only active services' do
    Service.create(title: 'service 1')
    Service.create(title: 'service 2', is_visible: true)
    Service.create(title: 'service 3', is_visible: false)

    services_visible = Service.where(is_visible: true)
    assert_equal(3, Service.count)
    assert_equal(2, services_visible.count)

    services_invisible = Service.where(is_visible: false)
    assert_equal(services_invisible.count, 1)
  end

  test 'service should return en translation' do
    I18n.locale = :en
    Service.create(title: 'en service')
    I18n.locale = :ru
    Service.create(title: 'ru service')

    en_services = Service.with_translations(I18n.locale)
    assert_equal(en_services.count, 1)
  end

end
