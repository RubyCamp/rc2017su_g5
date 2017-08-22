require 'dxruby'
require 'chipmunk'
require_relative 'lib/cp_static_box'
require_relative 'lib/player'

Window.width = 1024
Window.height = 768

space = CP::Space.new
space.gravity = CP::Vec2.new(0, 100)
speed = 1 / 60.0

objects = []
objects << CPStaticBox.new(0, 748, 1024, 20, space)
objects << CPStaticBox.new(0, 0, 20, 748, space)
objects << CPStaticBox.new(1004, 0, 20, 748, space)#(ｘ座標,ｙ座標,幅,高さ)
objects << CPStaticBox.new(0, 0, 1024, 20, space)

objects << Player.new(100,100,space)

Window.loop do
    break if Input.key_push?(K_ESCAPE)
  space.step(speed)
  objects.each do |obj|
    obj.draw
  end

end
