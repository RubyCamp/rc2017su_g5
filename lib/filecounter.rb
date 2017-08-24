class Filecounter
  def counter
    arr = Dir.glob('map/*.txt')
    puts arr.length
  end
end
