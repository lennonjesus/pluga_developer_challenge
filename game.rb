require './board.rb'
require './computer.rb'
require './constants.rb'

class Game

  def initialize
    @board = Board.new
    @computer = Computer.new
  end

  def start_game

    puts %(
      Hello!
      
      Welcome to Tic tac Toe!
    )

    ready = nil

    until ready
      print 'Are you ready? [yes/no] '
    
      ready = gets.chomp[0]

      ready = nil unless ready == 'Y' || ready == 'y'
    end

    puts "\nOk! Let's game! ;)"

    # start by printing the board
    puts @board
    
    # loop through until the game was won or tied
    until @board.is_game_over || @board.is_board_full
      get_human_spot
      if !@board.is_game_over && !@board.is_board_full
        @computer.eval_board(@board)
      end

      puts @board

      puts "Your move!\n\n"
    end

    puts "=== Game over ==="
  end

  def get_human_spot

    spot = nil

    until spot
      begin
        print "Enter an integer number between 0 and 8: "
        spot = Integer(gets.chomp)
      rescue
        puts "Invalid option! Please..."
        retry
      end

      if @board.cells[spot] != COMPUTER_MARKER && @board.cells[spot] != HUMAN_MARKER
        @board.cells[spot] = HUMAN_MARKER
      else
        spot = nil
      end
    end
  end

end

game = Game.new
game.start_game
