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

AdminUser.delete_all
user=AdminUser.find_by(:email=>"shopomob@shopomob.ru")
if (user.blank?)
  AdminUser.create!(:email => 'shopomob@shopomob.ru', :password => 'shopomobpass', :password_confirmation => 'shopomobpass') if user.nil?
end

default_locale = "ru"
require 'csv'
path_to_app = Rails.root.join('db', 'csv') #File.dirname(__FILE__)+'/csv/'
path_to_img = Rails.root.join('db', 'images') #File.dirname(__FILE__)+'/images/'

file_path = "#{path_to_app}/services.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  if row['locale'] == default_locale
  item = Service.find_or_create_by!( title: row['title'], stext:row['stext'], text: row['text'], price: row['price'].to_i, link: row['url'])
  if (!row['image'].blank?)
    img_path = path_to_img + row['image']
    if (File.exists?(img_path))
      item.image = Image.create(:image=>File.open(img_path))
    end
  end
  end
end
#start translations for services
file_path = "#{path_to_app}/services.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  item = Service.find_by( id: row['id'])
  item.translations.find_or_create_by(service_id: item.id, title: row['title'], stext:row['stext'], text: row['text'], price: row['price'].to_i, link: row['url'], locale: row['locale']) if item.present?
end
#end translations for services


path_to_img = Rails.root.join('db', 'images', 'teamers')
file_path = "#{path_to_app}/teamers.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  if row['locale'] == default_locale
  item = Teamer.find_or_create_by!( secondname: row['sname'], firstname:row['fname'], text: row['text'])
  if (!row['image'].blank?)
    img_path = path_to_img + row['image']
    if (File.exists?(img_path))
      item.image = Image.create(:image=>File.open(img_path))
    end
  end
  end
end

#start translations for teamers
file_path = "#{path_to_app}/teamers.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  item = Teamer.find_by( id: row['id'])
  item.translations.find_or_create_by(teamer_id: item.id, secondname: row['sname'], firstname:row['fname'], text: row['text'], locale: row['locale'])
end
#end translations for teamers


path_to_img = Rails.root.join('db', 'images', 'posts')
file_path = "#{path_to_app}/posts.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  if row['locale'] == default_locale
  item = Post.find_or_create_by!(title: row['title'], slug: row['slug'], text: row['text'], stext: row['stext'], tags: row['tags'])
  if (!row['image'].blank?)
    img_path = path_to_img + row['image']
    if (File.exists?(img_path))
      item.images.append(Image.create(:image=>File.open(img_path)))
    end
  end
  end
end
#start translations for posts
file_path = "#{path_to_app}/posts.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  item = Post.find_by( id: row['id'])
  item.translations.find_or_create_by(post_id: item.id, title: row['title'], slug: row['slug'], text: row['text'], stext: row['stext'], tags: row['tags'], locale: "ru")
end
#end translations for posts


path_to_img = Rails.root.join('db', 'images', "sm", 'gallery')
file_path = "#{path_to_app}/galleries.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  if row['locale'] == default_locale
  item = Gallery.find_or_create_by!( title: row['title'] )
  puts "g created: #{item.title} #{row['image']}"
  if (!row['image'].blank?)
    puts img_path = path_to_img + row['image']
    if (File.exists?(img_path))
      item.images.append(Image.create(:image=>File.open(img_path), :url=>row['url'], title:row['image_name'], text:row['image_text']))
    end
  end
  end
end
#start translations for galleries
file_path = "#{path_to_app}/galleries.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  item = Gallery.find_by( id: row['gallery_id'])
  item.translations.find_or_create_by(gallery_id: item.id, title: row['title'], locale: row['locale'])
  #puts "#{item.id} #{row['image']}"
  image = Image.find_by(image_file_name:row['image'])
  #puts "#{image.id} #{row['image']}"
  #item.images.each do |image|
    #image.find_or_create_by(:image=>File.open(img_path),:title=>row['image_name'], :t lext=>row['image_text'],:url=>row['url']))
    image.translations.find_or_create_by(image_id:image.id, locale:row['locale'], title:row['image_name'], text:row['image_text']) if image.present?
  #end
end
#end translations for galleries

#file_path = "#{path_to_app}/service_tarifs.csv"
#puts file_path
#CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
#  service = Service.find_by( title: row['service_title'] )
#
#  if service
#    s_tarif = ServiceTarif.find_or_create_by!(title: row['title'], text: row['text'], service: service)
#    st_price = ServiceTarifPrice.find_or_create_by(price: row['price'].to_f, condition1: row['condition1'].to_f, condition2: row['condition2'].to_f, service_tarif: s_tarif)
#    #service.service_tarifs.append(s_tarif)
#  else
#    puts "service not found: #{row['service_title']}"
#  end
#  item.translations.find_or_create_by(title: row['title'], slug: row['slug'], text: row['text'], stext: row['stext'], tags: row['tags'], locale: "ru")
#
#end
