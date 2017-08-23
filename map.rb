require 'dxruby'
require 'chipmunk'

require_relative 'mapfile'
require_relative 'map_display'

Window.width = 1000
Window.height = 600


@space = CP::Space.new
objects=[]


class Map

  SPEED=1/60.0


  def initialize(space)
    @space = space
  end

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
          objects << Wall.new(j*10, i*10 ,@space)
        when 2 then
          objects << Goal.new(j*10, i*10 ,@space)
        when 2 then
          objects << Switch1.new(j*10, i*10 ,@space)
        end
      end
    end

    Window.loop do
    @space.step(SPEED)
    objects.each do |obj|
      obj.draw
    end
    break if Input.key_push?(K_RETURN)
    Window.draw_font(500, 280, "Hello World", Font.new(16))
    end
  end
end