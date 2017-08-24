require_relative 'map'

class Player
   DEFAULT_COLLISION_TYPE = 1

  def initialize(x, y, space)
    #@player = Image.load('img/character.png')
    @player.set_color_key([255, 255, 255])
    @jumpcount = 0
    @image_right=Image.load('cafeole_right.png')
    @image_left=Image.load('cafeole_left.png')
    m = 10
    @r = image_right.width / 2
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
    puts @body.v.x.to_i
    if Input.key_push?(K_SPACE)&&@body.v.y.to_i == 0
      @body.v.y += -100
    end
    puts @body.v.y.to_i
    if Input.key_down?(K_RIGHT)
      @body.v.x += 5
      Window.draw(@body.p.x,@body.p.y,@image_right)
    elsif Input.key_down?(K_LEFT)
      @body.v.x -= 5
      Window.draw(@body.p.x,@body.p.y,@image_left)
    elsif  @body.v.y.to_i == 0
      @body.v.x = 0
      Window.draw(@body.p.x,@body.p.y,@image_right)
    end
    Window.draw(@body.p.x - @r, @body.p.y - @r, @player)
  end

  def goals
    return @body.p.x,@body.p.y
  end
end
