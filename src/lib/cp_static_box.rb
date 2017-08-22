class CPStaticBox
  DEFAULT_COLLISION_TYPE = 2
  def initialize(x, y, w, h, space)
    @x, @y = x, y
    @image = Image.new(w, h, C_WHITE)
    @body = CP::StaticBody.new
    @body.p = CP::Vec2.new(0, 0)
    verts = [
      CP::Vec2.new(x, y),         # 第１頂点（左上）
      CP::Vec2.new(x, y + h),     # 第２頂点（左下）
      CP::Vec2.new(x + w, y + h), # 第３頂点（右下）
      CP::Vec2.new(x + w, y)      # 第４頂点（右上）
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
