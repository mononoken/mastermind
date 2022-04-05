module Colors
  NUM_COLORS = {
    1 => 'red',
    2 => 'green',
    3 => 'blue',
    4 => 'yellow',
    5 => 'white',
    6 => 'black'
  }

  def convert_to_color(num)
    NUM_COLORS[num]
  end

  def convert_to_colors(nums_array)
    nums_array.map { |num| convert_to_color(num) }
  end
end
