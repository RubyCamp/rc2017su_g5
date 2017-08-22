require 'dxruby'
require 'chipmunk'

require_relative 'mapfile'

class Map
  # map1 = Mapfile.new(1)
  # arr = Array.new(100).map{Array.new(60,0)}
  # arr=map1.map

  def put #読み込む
    map1 = Mapfile.new(1)
    arr = Array.new(100).map{Array.new(60,0)}
    arr=map1.map


    60.times do |i|
      100.times do |j|
        num=arr[i][j]
        print num
        case num
        when 0 then
          #null
        when 1 then
          #wall
        when 2 then
          #goal
        end
      end
    end
  end

end

map = Map.new
map.put
