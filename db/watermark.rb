require 'RMagick'
#run from root project as:
#$ ruby db/watermark.rb
#Rails.root.join('db', 'images', 'gallery_whatermark')#
puts current_path = File.expand_path(File.dirname(__FILE__) + "/images/gallery/")
output_path = File.expand_path(File.dirname(__FILE__)+ "/images/gallery_watermark/")

wtm_file = current_path+'/../watermark_dn.png'
wtm_file2 = current_path+'/../watermark_up.png'
wtm = Magick::Image.read(wtm_file).first
wtm2 = Magick::Image.read(wtm_file2).first

Dir.mkdir(output_path) unless File.exists?(output_path)
Dir.open(current_path).each do |file|
  next if file[-4..-1] != '.jpg'
  next if file =~ /^\.\.?$/

  image = Magick::Image.read(current_path+"/"+file).first
  image.resize!(2000, 1500)
  image.composite!(wtm, Magick::SouthWestGravity, Magick::HardLightCompositeOp)
  image.composite!(wtm2, Magick::NorthEastGravity, Magick::HardLightCompositeOp)

  puts out = file#.sub(/\./, "-wm.")
  image.write(output_path+"/"+out)
end