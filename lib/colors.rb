module Colors
  def color_legend
    {
      red: 'RED',
      blue: 'BLU',
      yellow: 'YLW',
      green: 'GRN',
      white: 'WHT',
      black: 'BLK'
    }
  end

  def convert_color_to_legend(color)
    color_legend.fetch(color.to_sym)
  end
end
