class ClassName
    def initialize
        @space = CP::Space.new
        @space.gravity = CP::Vec2.new(0, 100)
        @speed = 1 / 60.0
        @objects = []

    end
end