# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Service.create(title:"Мобильное приложение и/или интернет-магазин", text:"для продажи товаров или услуг", stext:"для продажи товаров или услуг")
#Service.create(title:"электронный справочник Владикавказа", text:"популярные мобильные плтатформы: Android и iOS (iPhone, iPad)", stext:"популярные мобильные плтатформы: Android и iOS (iPhone, iPad)")
#Service.create(title:"СМС-рассылка", text:"от 30 копеек", stext:"от 30 копеек")
require 'csv'
path_to_app = Rails.root.join('db', 'csv') #File.dirname(__FILE__)+'/csv/'
path_to_img = Rails.root.join('db', 'images') #File.dirname(__FILE__)+'/images/'

file_path = "#{path_to_app}/services.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  #item = Service.find_or_create_by( order_id: row['order_id'].to_i, title: row['title'], text: row['text'], url: row['url'])
  item = Service.find_or_create_by( title: row['title'], stext:row['text'][0,64], text: row['text'], link: row['url'])
  if (!row['image'].blank?)
    img_path = path_to_img + row['image']
    if (File.exists?(img_path))
      item.image = Image.create(:image=>File.open(img_path))
    end
  end
end