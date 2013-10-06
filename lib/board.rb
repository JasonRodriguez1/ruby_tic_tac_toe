class Board
  def initialize
    @new_board = []
    @cells = []
    @game = Game.new
  end 

  def get_game
    @game
  end

  def new_board
    @new_board
  end

  def mark_cell(x,y)
    x_or_o = @game.current_player
    @cells.each do |cell|
      if cell.get_x_coordinate == x && cell.get_y_coordinate == y
        cell.set_mark(x_or_o)
      end
    end
  end

  def cells
    @cells
  end

  def create_cells       
    3.times do |x|
      3.times do |y|  
        @cells << Cell.new(x, y)
      end
    end
  end 
end