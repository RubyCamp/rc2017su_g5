# See: https://github.com/chipmunk-rb/chipmunk/wiki

require 'dxruby'
require 'chipmunk'


require_relative 'director'
require_relative 'lib/base/cp_base'
require_relative 'lib/base/cp_box'
require_relative 'lib/base/cp_circle'
require_relative 'lib/base/cp_static_box'

require_relative 'lib/wall'
require_relative 'lib/ball'
require_relative 'lib/box'


Window.width = 1000
Window.height = 600

director = Director.new

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  director.play
end
