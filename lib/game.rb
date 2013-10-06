class Game
  def initialize
    @players = ['x','o']
    @current_player = 'x'
    @board = Board.new
  end

  def get_board
     @board
  end

  def current_player
    @current_player
  end

  def next_turn
    @players.rotate!
    @current_player = @players[0]
  end
  
  def vertical_matches?
    three_in_a_row = false
    3.times do |x|
      cells_in_current_column = []
      @board.cells.each do |cell|
        if cell.x == x
          cells_in_current_column << cell
        end
      end
      if cells_in_current_column[0] == cells_in_current_column[1] && cells_in_current_column[0] == cells_in_current_column[2]
      three_in_a_row = true
      end
    end
  three_in_a_row  
  end

  def horizontal_matches?
    three_in_a_row = false
    3.times do |y|
      cells_in_current_row = []
      @board.cells.each do |cell|
        if cell.y == y
          cells_in_current_row << cell
        end
      end
      if cells_in_current_row[0] == cells_in_current_row[1] && cells_in_current_row[0] == cells_in_current_row[2]
      three_in_a_row = true
      end
    end
  three_in_a_row  
  end
  
  def diagonal_matches?
    three_in_a_row = false
    3.times do |x|
      cells_in_current_daigonal = []
      @board.cells.each do |cell|
        if cell.x == y
          cells_in_current_daigonal << cell
        end
      end
      if cells_in_current_daigonal[0] == cells_in_current_daigonal[1] && cells_in_current_daigonal[0] == cells_in_current_daigonal[2]
      three_in_a_row = true
      end
    end
  three_in_a_row  
  end
end