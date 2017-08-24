require_relative 'mapfile.rb'

class Test
  def test
    map = Mapfile.new(1)
    p map.map
  end
end

test = Test.new
test.test
