require 'dxruby'
require 'chipmunk'

require_relative 'mapfile'
require_relative 'map_display'

Window.width = 1000
Window.height = 600

speed=1/60.0
space = CP::Space.new
objects=[]


class Map

  def put(num)#読み込む
    map1 = Mapfile.new(num)
    arr = Array.new(100).map{Array.new(60,0)}
    arr=map1.map
    objects=[]

    60.times do |i|
      100.times do |j|
        num=arr[i][j]
        case num
        when 0 then
          #null
        when 1 then
          objects << Wall.new(i*10, j*10 ,space)
        when 2 then
          objects << Goal.new(i*10, j*10 ,space)
        end
      end
    end

    Window.loop do
    space.step(speed)
    objects.each do |obj|
      obj.draw
    end
    break if Input.key_push?(K_RETURN)
    Window.draw_font(500, 280, "Hello World", font)
    end
  end
end