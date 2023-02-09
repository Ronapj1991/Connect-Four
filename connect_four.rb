require_relative 'board.rb'
require_relative 'player.rb'

my_board = Board.new()
me = Player.new("Ron", "X")
my_board.win?(5, 6, "X")