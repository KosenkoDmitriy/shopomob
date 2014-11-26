require 'RMagick'
#Rails.root.join('db', 'images', 'gallery_whatermark')#
current_path = File.expand_path(File.dirname(__FILE__))
output_path = File.expand_path(File.dirname(__FILE__))+"/gallery_watermark/"
wtm_file = current_path+'/watermark_dn.png'
wtm = Magick::Image.read(wtm_file).first
wtm_file2 = current_path+'/watermark_up.png'
wtm2 = Magick::Image.read(wtm_file2).first

Dir.mkdir(output_path) unless File.exists?(output_path)

Dir.open(current_path).each do |file|
  next if file[-4..-1] != '.jpg'
  next if file =~ /^\.\.?$/

  image = Magick::Image.read(file).first
  image.resize!(2000, 1500)
  image.composite!(wtm, Magick::SouthWestGravity, Magick::HardLightCompositeOp)
  image.composite!(wtm2, Magick::NorthEastGravity, Magick::HardLightCompositeOp)

  puts out = file#.sub(/\./, "-wm.")
  image.write(output_path+out)
end