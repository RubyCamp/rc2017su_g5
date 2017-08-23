require 'dxruby'
require 'chipmunk'

require_relative 'mapfile'
require_relative 'map_display'

class Map
  # map1 = Mapfile.new(1)
  # arr = Array.new(100).map{Array.new(60,0)}
  # arr=map1.map

  def put #読み込む
    map1 = Mapfile.new(1)
    arr = Array.new(100).map{Array.new(60,0)}
    arr=map1.map
    space = CP::Space.new


    60.times do |i|
      100.times do |j|
        num=arr[i][j]
        objects=[]
        case num
        when 0 then
          #null
        when 1 then
          objects << Wall.new(i*10, j*10 ,space)
        when 2 then
          #goal
        end
      end
    end
  end

end

map = Map.new
map.put
