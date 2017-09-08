SimpleCaptcha.setup do |sc|
  # default: 100x28
  sc.image_size = '150x30'

  # default: 5
  sc.length = 10

  # default: simply_blue
  # possible values:
  # 'embosed_silver',
  # 'simply_red',
  # 'simply_green',
  # 'simply_blue',
  # 'distorted_black',
  # 'all_black',
  # 'charcoal_grey',
  # 'almost_invisible'
  # 'random'
  #sc.image_style = 'simply_green'

  # default: low
  # possible values: 'low', 'medium', 'high', 'random'
  sc.distortion = 'random' #'high'

  # default: medium
  # possible values: 'none', 'low', 'medium', 'high'
  sc.implode = 'high'

  # own style
  sc.image_style = 'mycaptha'
  sc.add_image_style('mycaptha', [
      "-background '#000'",
      "-fill '#f9f4d3'",
      "-border 1",
      "-bordercolor '#000'"])
end
