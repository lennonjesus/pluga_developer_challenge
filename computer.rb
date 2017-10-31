require './constants.rb'

class Computer

  def eval_board(board)
    spot = nil
    until spot
      if board.cells[4] == "4"
        spot = 4
        board.cells[spot] = COMPUTER_MARKER
      else
        spot = get_best_move(board)

        if board.cells[spot] != COMPUTER_MARKER && board.cells[spot] != HUMAN_MARKER
          board.cells[spot] = COMPUTER_MARKER
        else
          spot = nil
        end
      end
    end
  end

  private
  
  def get_best_move(board)

    cells = board.cells

    available_spaces = []
    best_move = nil

    cells.each do |s|
      if s != COMPUTER_MARKER && s != HUMAN_MARKER
        available_spaces << s
      end
    end

    available_spaces.each do |as|
      cells[as.to_i] = COMPUTER_MARKER

      if board.is_game_over
        best_move = as.to_i
        cells[as.to_i] = as

        return best_move
      else
        cells[as.to_i] = HUMAN_MARKER

        if board.is_game_over
          best_move = as.to_i
          cells[as.to_i] = as

          return best_move
        else
          cells[as.to_i] = as
        end
      end
    end

    if best_move
      return best_move
    else
      random = rand(0..available_spaces.count)
      return available_spaces[random].to_i
    end
  end

end
