require './constants.rb'

class Board

  def initialize
    @cells = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def cells
    @cells
  end

  def is_game_over
    [@cells[0], @cells[1], @cells[2]].uniq.length == 1 ||
    [@cells[3], @cells[4], @cells[5]].uniq.length == 1 ||
    [@cells[6], @cells[7], @cells[8]].uniq.length == 1 ||
    [@cells[0], @cells[3], @cells[6]].uniq.length == 1 ||
    [@cells[1], @cells[4], @cells[7]].uniq.length == 1 ||
    [@cells[2], @cells[5], @cells[8]].uniq.length == 1 ||
    [@cells[0], @cells[4], @cells[8]].uniq.length == 1 ||
    [@cells[2], @cells[4], @cells[6]].uniq.length == 1
  end

  def is_board_full
    cells.all? { |s| s == COMPUTER_MARKER || s == HUMAN_MARKER }
  end

  def to_s
    %(
      #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
      ===+===+===
      #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
      ===+===+===
      #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
    ) 
  end

end
