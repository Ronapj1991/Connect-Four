require_relative 'board.rb'
require_relative 'player.rb'

puts %{
  Welcome to Connect-Four CLI Edition!
}

game_board = Board.new()
player1 = Player.new("P1", "X")
player2 = Player.new("P2", "O")
winner = nil

current_player = player1

loop do
  puts "#{current_player.name} Choose your column"
  game_board.board
  
  puts "choose a column 1-7"
  p_col = gets.chomp
  p_col = p_col.to_i - 1 
  
  until !game_board.col_full?(p_col)
    puts "The column is filled"
    puts "choose a column 1-7"
    p_col = gets.chomp
    p_col = p_col.to_i - 1 
  end
  

  game_board.update_cell(p_col, current_player.symbol)
  if game_board.win?(game_board.highest_row(p_col), p_col, current_player.symbol) 
    break
  end
  
  if current_player.equal?(player1) 
    current_player = player2 
  else
    current_player = player1 
  end
end

puts "\n#{current_player.name} wins!"
game_board.board