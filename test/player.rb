class Player
  attr_accessor :is_floor

  def initialize(x, y, space)
    @player = Image.load('img/character.png')
    @player.set_color_key([255, 255, 255])
    @is_floor = true

    m = 10
    @r = @player.width / 2
    moment = CP::moment_for_circle(m, 0, @r, CP::Vec2.new(0, 0))
    @body = CP::Body.new(m, moment)
    @body.p = CP::Vec2.new(x + @r, y + @r)
    @shape = CP::Shape::Circle.new(@body, @r, CP::Vec2.new(0, 0))

    @shape.e = 0.0
    @shape.u = 0.5

    @body.add_to_space(space)
    @shape.add_to_space(space)
  end

  def draw
    @body.v.x.to_i
    p @is_florr
    if Input.key_push?(K_SPACE)&&@is_floor&&@body.v.y == 0
      p @is_floor
      @is_floor=false
      @body.v.y += -96
    end
    @body.a.y.to_i
    if Input.key_down?(K_RIGHT)
      @body.a.x += 5
    elsif Input.key_down?(K_LEFT)
      @body.a.x -= 5
      # elsif  @body.v.y.to_i == 0
      # #  @body.v.x = 0
    end
    Window.draw(@body.p.x - @r, @body.p.y - @r, @player)
  end

  def goals
    return @body.p.x,@body.p.y
  end
end
