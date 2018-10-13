require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "service should return en translation" do
    I18n.locale = :en
    Service.create(title: 'en service')
    I18n.locale = :ru
    Service.create(title: 'ru service')

    en_services = Service.with_translations(I18n.locale)
    I18n.locale = :ru
    assert_equal(en_services.count, 1)  
  end
end
