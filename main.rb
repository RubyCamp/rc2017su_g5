require 'dxruby'
require 'chipmunk'

require_relative 'filecounter'
require_relative 'map'

filecounter = Filecounter.new
course = filecounter.counter

Window.width = 1000
Window.height = 600
space = CP::Space.new
space.gravity = CP::Vec2.new(0, 100)
speed=1/60.0
objects=[]

map = Map.new(space)

font = Font.new(16)

# スタート画面
Window.loop do
  exit if Input.key_push?(K_ESCAPE)
  break if Input.key_push?(K_RETURN)
end

number = course.to_i

0.upto(number + 1) do |num|
  p num + 1
  map.put(num)
  map.delete
end

# ボス画面
Window.loop do
  break if Input.key_push?(K_RETURN)
  Window.draw_font(500, 280, "ボス対戦", font)

end

# 結果発表
Window.loop do

  break if Input.key_push?(K_ESCAPE)
  Window.draw_font(500, 280, "結果発表", font)

end
