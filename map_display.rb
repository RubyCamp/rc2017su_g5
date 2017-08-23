require 'dxruby'
require 'chipmunk'

class Wall
  
  def initialize(x, y, space)
    @x, @y = x, y
    @image = image = Image.load('wall.png')
    @body = CP::StaticBody.new
    @body.p = CP::Vec2.new(0, 0)
    verts = [
      CP::Vec2.new(x, y),         # 第１頂点（左上）
      CP::Vec2.new(x, y + 10),     # 第２頂点（左下）
      CP::Vec2.new(x + 10, y + 10), # 第３頂点（右下）
      CP::Vec2.new(x + 10, y)      # 第４頂点（右上）
    ]
    @shape = CP::Shape::Poly.new(@body, verts, CP::Vec2.new(0, 0))
    @shape.e = 1.0
    @shape.u = 0.0
    puts "======"
    puts @shape
    puts space == nil
    @shape.add_to_space(space)

    def draw
      Window.draw(@x, @y, @image)
    end
  end
end

class Goal
  def initialize(x, y, space)
    @x, @y = x, y
    @image = Image.new(10, 10, C_RED) #画像を読み込む形に差し替えお願いします
    @body = CP::StaticBody.new
    @body.p = CP::Vec2.new(0, 0)
    verts = [
      CP::Vec2.new(x, y),         # 第１頂点（左上）
      CP::Vec2.new(x, y + 10),     # 第２頂点（左下）
      CP::Vec2.new(x + 10, y + 10), # 第３頂点（右下）
      CP::Vec2.new(x + 10, y)      # 第４頂点（右上）
    ]
    @shape = CP::Shape::Poly.new(@body, verts, CP::Vec2.new(0, 0))
    @shape.e = 1.0
    @shape.u = 0.0
    @shape.add_to_space(space)
  end

  def draw
    Window.draw(@x, @y, @image)
  end
end