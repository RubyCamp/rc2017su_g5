class Hits
  def initialize(space)
    @space = space
    _set_collisions_
  end
  def _set_collisions_
    _set_collision_player_and_item
  end

  def _set_collision_player_and_item
    @space.add_collision_handler(Player::DEFAULT_COLLISION_TYPE, CPStaticBox::DEFAULT_COLLISION_TYPE) do |player,box, arb|
      @space.add_post_step_callback(box) do |_, shape|
        p "div"
      end
    end
  end
end
