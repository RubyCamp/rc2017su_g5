class Mapfile
  def initialize(number)
    @number = number
  end

  def map
    map_arr = Array.new()

    File.open("map/#{@number}.txt", "rt") do |f|
      f.each do |number|
        map_arr << number.chomp.split("").map do |array|
          array.to_i
        end
      end
    end

    return map_arr
  end
end
