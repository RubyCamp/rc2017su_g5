class Player < CPCircle
  attr_accessor :is_floor

  DEFAULT_COLLISION_TYPE = 3
  DEFAULT_E = 0.0
  DEFAULT_U = 0.0
  def initialize(x, y, r, opt = {})
    super

    # ボールの物理特性を設定
    shape.e = opt[:shape_e] || DEFAULT_E  # 弾性係数（0.0 - 1.0）
    shape.u = opt[:shape_u] || DEFAULT_U  # 摩擦係数（0.0 - 1.0）
    shape.collision_type = opt[:collision_type] || DEFAULT_COLLISION_TYPE # 衝突種別

    @player_right = Image.load('img/cafeole_right.png')
    @player_left = Image.load('img/cafeole_left.png')
    @player_right.width
    @player_right.set_color_key([255, 255, 255])
    @player_left.set_color_key([255, 255, 255])
    @is_floor = true

    # m = 10
    # @r = @player.width / 2
    # moment = CP::moment_for_circle(m, 0, @r, CP::Vec2.new(0, 0))
    # @body = CP::Body.new(m, moment)
    # @body.p = CP::Vec2.new(x + @r, y + @r)
    # @shape = CP::Shape::Circle.new(@body, @r, CP::Vec2.new(0, 0))
    #
    # @shape.e = 0.0
    # @shape.u = 0.1
    #
    # @body.add_to_space(space)
    # @shape.add_to_space(space)
  end

  def draw
    # 主人公の動き
    if Input.key_push?(K_SPACE) && @is_floor && @body.v.y == 0
      p @is_floor
      @is_floor = false
      @body.v.y += -150
    end
    if Input.key_down?(K_RIGHT)
      @body.v.x += 1

      Window.draw_add(@body.p.x - 1.5 * @r, @body.p.y - 1.5 * @r, @player_right)
    elsif Input.key_down?(K_LEFT)
      @body.v.x -= 1

      Window.draw_add(@body.p.x - 1.5 * @r, @body.p.y - 1.5 * @r, @player_left)
    else
      Window.draw_add(@body.p.x - 1.5 * @r, @body.p.y - 1.5 * @r, @player_right)
      @body.v.x = 0
    end
    # Window.draw(@body.p.x - @r, @body.p.y - @r, @player)
  end

  def goals
    [@body.p.x, @body.p.y]
  end

  def goal?(x, y); end
end
