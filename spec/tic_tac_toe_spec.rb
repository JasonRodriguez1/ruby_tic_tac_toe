require 'rspec'
require 'board'
require 'cell'
require 'game' 

describe Board do
  it 'initializes the game board' do
    test_board = Board.new
    test_board.should be_an_instance_of Board
  end
  it 'starts off empty' do
    test_board = Board.new
    test_board.new_board.should eq []
  end 
  it 'creates 9 cells' do
    test_board = Board.new
    test_board.create_cells
    test_board.cells.length.should eq 9
  end

  it 'creates the right coordinates' do
    test_board = Board.new
    test_board.create_cells
    test_board.cells.first.get_x_coordinate.should eq 0
    test_board.cells.first.get_y_coordinate.should eq 0
    test_board.cells.last.get_x_coordinate.should eq 2
    test_board.cells.last.get_y_coordinate.should eq 2
  end

  it 'puts cells into itself' do
    test_board = Board.new
    test_board.create_cells
    test_board.cells.first.should be_an_instance_of Cell
  end

  it 'marks a cell based on coordinates' do
    test_board = Board.new
    test_cell = Cell.new(0, 1)
    test_board.create_cells
    Cell.any_instance.should_receive(:set_mark).with("o")
    test_board.mark_cell(1,1,"o")
  end 
end

describe Cell do
  it 'starts out empty' do
    test_cell = Cell.new(0, 1)
    test_cell.should be_an_instance_of Cell 
  end
  it 'creates a marker in a cell that stores the player\'s choice' do
    test_cell = Cell.new(0, 1)
    test_cell.get_mark.should eq nil
  end
  it "sets mark to 'x' or 'o'" do
    test_cell = Cell.new(0, 1)
    test_cell.set_mark('x').should eq 'x'
  end
  it 'checks to see if a cell is empty' do
    test_cell = Cell.new(0, 1)
    test_cell.is_empty?.should eq true
  end
end

describe Game do
  it 'starts out empty' do
    test_game = Game.new
    test_game.should be_an_instance_of Game 
  end
  it 'has x go first' do
    test_game = Game.new
    test_game.current_player.should eq 'x'
  end
  it 'rotates between "x" and "o"' do
    test_game = Game.new
    test_game.next_turn
    test_game.current_player.should eq 'o'
  end
  it 'checks for a vertical match' do
    test_game = Game.new
    test_game.get_board.mark_cell(0,0,'x')
    test_game.get_board.mark_cell(0,1,'x')
    test_game.get_board.mark_cell(0,2,'x')
    test_game.vertical_matches?.should eq true
  end
  it 'checks for a horizontal match' do
    test_game = Game.new
    test_game.get_board.mark_cell(0,0,'o')
    test_game.get_board.mark_cell(1,0,'o')
    test_game.get_board.mark_cell(2,0,'o')
    test_game.horizontal_matches?.should eq true
  end
  it 'checks for a daigonal match' do
    test_game = Game.new
    test_game.get_board.mark_cell(0,0,'o')
    test_game.get_board.mark_cell(1,1,'o')
    test_game.get_board.mark_cell(2,2,'o')
    test_game.diagonal_matches?.should eq true
  end
end










