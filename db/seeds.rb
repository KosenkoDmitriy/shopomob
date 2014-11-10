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


require 'csv'
path_to_app = Rails.root.join('db', 'csv') #File.dirname(__FILE__)+'/csv/'
path_to_img = Rails.root.join('db', 'images') #File.dirname(__FILE__)+'/images/'

#file_path = "#{path_to_app}/services.csv"
#puts file_path
#CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
#  #item = Service.find_or_create_by( order_id: row['order_id'].to_i, title: row['title'], text: row['text'], url: row['url'])
#  item = Service.find_or_create_by( title: row['title'], stext:row['stext'], text: row['text'], price: row['price'].to_i, link: row['url'])
#  if (!row['image'].blank?)
#    img_path = path_to_img + row['image']
#    if (File.exists?(img_path))
#      item.image = Image.create(:image=>File.open(img_path))
#    end
#  end
#end
#
#
#file_path = "#{path_to_app}/teamers.csv"
#puts file_path
#CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
#  item = Teamer.find_or_create_by( secondname: row['sname'], firstname:row['fname'], text: row['text'])
#  if (!row['image'].blank?)
#    img_path = path_to_img + row['image']
#    if (File.exists?(img_path))
#      item.image = Image.create(:image=>File.open(img_path))
#    end
#  end
#end
#
#
#[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15].each do |index|
#  title = "Post#{index}";
#  slug = "post#{index}";
#  stext = "Post#{index} "*50;
#  text = "Post#{index} "*500;
#  tags = "post#{index}";
#  post=Post.find_or_create_by!(slug:slug,title:title, stext:stext, text:text, tags:tags)
#end
#
#
#path_to_img = Rails.root.join('db', 'images', 'gallery')
#file_path = "#{path_to_app}/galleries.csv"
#puts file_path
#CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
#  item = Gallery.find_or_create_by( title: row['title'] )
#  if (!row['image'].blank?)
#    img_path = path_to_img + row['image']
#    if (File.exists?(img_path))
#      item.images.append(Image.create(:image=>File.open(img_path)))
#    end
#  end
#end

path_to_img = Rails.root.join('db', 'images', 'posts')
file_path = "#{path_to_app}/posts.csv"
puts file_path
CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
  item = Post.find_or_create_by( title: row['title'], slug: row['slug'], text: row['text'] )
  if (!row['image'].blank?)
    img_path = path_to_img + row['image']
    if (File.exists?(img_path))
      item.images.append(Image.create(:image=>File.open(img_path)))
    end
  end
end