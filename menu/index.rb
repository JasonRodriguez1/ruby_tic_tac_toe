0require 'rspec'
require '../lib/board'
require '../lib/cell'
require '../lib/game' 

def init
  @game = Game.new
  puts "Welcome to Tic Tac Toe. Press 'p' to (p)lay. Press 'x' to e(x)it"
  input = gets.chomp
  if input == "p"
    main
  elsif input == 'x'
    exit
  else
    puts 'Invalid input.'
  init
  end
end

def main
  print
  puts "#{@game.current_player[0].upcase}\'s turn. Enter row number to play in (1-3):"
  @x = gets.chomp.to_i - 1
  puts "Enter the column number to play in (1-3):"
  @y = gets.chomp.to_i - 1
  this_cell = @game.board.select_cell(@x, @y)
  if this_cell.is_empty?
    this_cell.mark_cell(@game.current_player)
    @game.next_turn
    puts 'Well played! Now it is #{@game.current_player[0].upcase}\'s turn.'
    main
  elsif @game.vertical_matches? || @game.horizontal_matches? || @game.diagonal_matches?
      over
  else 
    puts "Sorry, that box is already taken. Please choose another coordinate."
    main
  end   
end

def over
  puts "#{@game.players[1]} won! [N]ew game or E[x]it?"
  input = gets.chomp.downcase
  if input == "n"
    init
  elsif input == 'x'
    exit
  else
    puts 'Invalid input. You will now be redirected to the main menu.'
  init
  end
end

def print
  puts "    1   2   3 "
  puts "              "
  puts "      |   |   "
  puts "1   #{@game.board.cells[0]} | #{@game.board.cells[1]} | #{@game.board.cells[2]} "
  puts "   ___|___|___"
  puts "      |   |   "
  puts "2   #{@game.board.cells[3]} | #{@game.board.cells[4]} | #{@game.board.cells[5]} "
  puts "   ___|___|___"
  puts "      |   |   "
  puts "3   #{@game.board.cells[6]} | #{@game.board.cells[7]} | #{@game.board.cells[8]} "
  puts "      |   |   "
end
init


# def comp_main
#   print
#   puts "It's your turn, X. Enter row number to play in (1-3):"
#   x = gets.chomp.to_i - 1
#   puts "Enter the column number to play in (1-3):"
#   y = gets.chomp.to_i - 1
#   if @grid.rows[x][y].mark != " "
#     puts "Invalid input. Box already taken"
#     comp_main
#   else
#     @grid.mark_cell([x, y])
#     @ai.set_win_score([x, y], :-)
#     puts @ai.win_scores
#     if @grid.turns == 9
#       cats
#     elsif @grid.find_winner.nil?
#       @grid.next_turn
#       comp_turn
#     else
#       over
#     end
#   end
# end

# def comp_turn
#   choice = @ai.winning_choice
#   puts choice
#   @grid.mark_cell(choice)
#   @ai.set_win_score(choice, :+)
#   if @grid.turns == 9
#     cats  
#   elsif @grid.find_winner.nil?
#     @grid.next_turn
#     comp_main
#   else
#     over
#   end
# end
















