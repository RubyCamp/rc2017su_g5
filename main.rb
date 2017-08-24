require 'dxruby'
require 'chipmunk'
require 'benchmark'

require_relative 'map'

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

score= Benchmark.measure {
  1.upto(6) do |num|
    p num
    map.put(num)
    map.delete
  end
}

p score.real

if score.real < 120
  result = "カレーができた！"
elsif
  result = "ボルシチができてしまった…"
end

# 結果発表
Window.loop do

  break if Input.key_push?(K_ESCAPE)
  Window.draw_font(500, 280, result, font)

end
