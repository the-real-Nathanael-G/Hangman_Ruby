class Life

  def initialize(life)
      @life = life
  end

  def picture_stages()
    {:start => "______",
    :stage_1 => "\n |\n |\n |\n_|_____",
    :stage_2 => "\n |/\n |\n |\n_|_____",
    :stage_3 => "\n _________\n |/\n |\n |\n_|_____",
    :stage_4 => "\n _________\n |/      |\n |\n |\n_|_____",
    :stage_5 => "\n _________\n |/      |\n |       0\n |\n_|_____",
    :stage_6 => "\n _________\n |/      |\n |       0\n |       @\n_|_____",
    :stage_7 => "\n _________\n |/      |\n |       0\n |      -@\n_|_____",
    :stage_8 => "\n _________\n |/      |\n |       0\n |      -@-\n_|_____",
    :stage_9 => "\n _________\n |/      |\n |       0\n |      -@-\n_|_____ /|",
    :stage_10 => "\n _________\n |/      |\n |       0\n |      -@-\n |      /|\n_|_____"}
  end

  def life_stages()
    stage = picture_stages[:start]
    case @life
    when 9
      stage = picture_stages[:stage_1]
    when 8
      stage = picture_stages[:stage_2]
    when 7
      stage = picture_stages[:stage_3]
    when 6
      stage = picture_stages[:stage_4]
    when 5
      stage = picture_stages[:stage_5]
    when 4
      stage = picture_stages[:stage_6]
    when 3
      stage = picture_stages[:stage_7]
    when 2
      stage = picture_stages[:stage_8]
    when 1
      stage = picture_stages[:stage_9]
    when 0
      stage = picture_stages[:stage_10]
    end
    stage
  end

end
