require 'dxruby'
require 'chipmunk'
require_relative 'src/lib/cp_static_box'
require_relative 'src/lib/cp_base'
require_relative 'src/lib/cp_circle'
require_relative 'src/lib/player'
require_relative 'src/hits'

require_relative 'mapfile'
require_relative 'map_display'

Window.width = 1000
Window.height = 600


@space = CP::Space.new

class Map

  SPEED=1/60.0


  def initialize(space)
    @space = space

  end

  

   def goal(x,y)
    return false
      if @goalx==x&&@goaly==y
        return true
      end
  end

  def put(num)#読み込む
    map1 = Mapfile.new(num)
    arr = Array.new(100).map{Array.new(60,0)}
    arr=map1.map
    objects=[]
    # space = CP::Space.new
    objects.clear
    @goalx=0;
    @goaly=0;

    player = Player.new(100,540, 16) #space)

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
          @goalx=j*10
          @goaly=i*10
        when 3 then
          objects << Switch1.new(j*10, i*10 ,@space)
        end
      end
    end

    player.add_to(@space)
    objects << player

    hits = Hits.new(@space)

    Window.loop do

      @space.step(SPEED)
      objects.each do |obj|
        obj.draw
      end
      break if goal(@body.p.x,@body.p.y)
    end
  end

  
end
