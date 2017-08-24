require 'dxruby'
require 'chipmunk'
require 'benchmark'

require_relative 'map'

Window.width = 1000
Window.height = 600
space = CP::Space.new
space.gravity = CP::Vec2.new(0, 100)

title_sound = Sound.new("music/title.wav")
@title = Image.load("img/curry_title.png")
@good = Image.load("img/goodend.png")
@bad = Image.load("img/badend.png")

map = Map.new(space)

# スタート画面
Window.loop do
  title_sound.play
  Window.draw(0,0,@title)
  exit if Input.key_push?(K_ESCAPE)
  break if Input.key_push?(K_RETURN)
end
title_sound.stop

score= Benchmark.measure {
  # コース数をここで決める
  1.upto(5) do |num|
    p num
    map.put(num)
    map.delete
  end
}

p score.real

if score.real < 300
  @result = @good
elsif
  @result = @bad
end

# 結果発表
Window.loop do

  break if Input.key_push?(K_ESCAPE)
  Window.draw(0,0,@result)

end
