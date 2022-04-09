module Colors
  NUM_COLORS = {
    '1' => 'red',
    '2' => 'green',
    '3' => 'blue',
    '4' => 'yellow',
    '5' => 'white',
    '6' => 'black'
  }

  def convert_to_color(num)
    NUM_COLORS.fetch(num.to_s)
  end

  def convert_to_colors(num_array)
    num_array.map { |num| convert_to_color(num) }
  end

  def convert_to_num(color)
    NUM_COLORS.key(color)
  end

  def convert_to_nums(colors)
    colors.map { |color| convert_to_num(color) }
  end
end
