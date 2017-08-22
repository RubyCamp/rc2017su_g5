class Player
  DEFAULT_COLLISION_TYPE = 3
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
    @shape.u = 0.3

    @body.add_to_space(space)
    @shape.add_to_space(space)
  end
=begin
  def _set_collisions
    _set_collision_player_and_item
  end

  def _set_collision_player_and_item
    @space.add_collision_handler(Player::DEFAULT_COLLISION_TYPE, CPStaticBox::DEFAULT_COLLISION_TYPE) do |ball,wall, arb|
      @space.add_post_step_callback(wall) do |_, shape|
        p "dev"
      end
    end
  end
=end
  def draw #主人公の動き ジャンプ途中でleft、rightキーを話すと止まってしまう
    if Input.key_push?(K_SPACE)&&@body.v.y.to_i == 0
      @body.v.y += -200
    end
    if Input.key_down?(K_RIGHT)
      @body.v.x += 1
    elsif Input.key_down?(K_LEFT)
      @body.v.x -= 1
    elsif  @body.v.y.to_i == 0
      @body.v.x = 0
    end
    Window.draw(@body.p.x - @r, @body.p.y - @r, @player)
  end
end
