class Player
  def initialize(x, y, space)
    @player = Image.load('img/character.png')
    @player.set_color_key([255, 255, 255])
    @jumpcount = 0

    m = 10
    @r = @player.width / 2
    moment = CP::moment_for_circle(m, 0, @r, CP::Vec2.new(0, 0))
    @body = CP::Body.new(m, moment)
    @body.p = CP::Vec2.new(x + @r, y + @r)
    @shape = CP::Shape::Circle.new(@body, @r, CP::Vec2.new(0, 0))

    @shape.e = 0.0
    @shape.u = 0.1

    @body.add_to_space(space)
    @shape.add_to_space(space)
  end

  def draw
    if Input.key_push?(K_SPACE) && @jumpcount < 2
      if @body.v.y.to_i == 0
        @jumpcount = 0
      end
      @body.v = CP::Vec2.new(0,-100)
      @jumpcount += 1
    end
    Window.draw(@body.p.x - @r, @body.p.y - @r, @player)
  end
end