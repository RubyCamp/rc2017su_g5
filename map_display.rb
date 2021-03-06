require 'dxruby'
require 'chipmunk'

class Wall
  DEFAULT_COLLISION_TYPE = 1
  def initialize(x, y, space)
    @x, @y = x, y
    @image =Image.load('img/wall.png')
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
    @shape.collision_type = DEFAULT_COLLISION_TYPE
    @shape.add_to_space(space)

    def draw
      Window.draw(@x, @y, @image)
    end
  end

  # 物理演算空間からのオブジェクト削除を一括して行うメソッド
  def remove_from(space)
    @shape.remove_from_space(space)
    @body.remove_from_space(space) if @body
  end
end

class Goal
  def initialize(x, y, space)
    @x, @y = x, y
    @image =Image.load('img/goal.png')
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
    Window.draw_add(@x, @y, @image)
  end
  def remove_from(space)
    @shape.remove_from_space(space)
    @body.remove_from_space(space) if @body
  end
end

class Switch1

  def initialize(x, y, space)
    @x, @y = x, y
    @image =Image.load('img/switch1.png')
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

    def draw
      Window.draw(@x, @y, @image)
    end
  end
  def remove_from(space)
    @shape.remove_from_space(space)
    @body.remove_from_space(space) if @body
  end
end
