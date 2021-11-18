module Game
  def self.start
    puts "Please input name of player 1:"
    name1 = gets.chomp
    player1 = Player.new(name1)
    puts "Please input name of player 2:"
    name2 = gets.chomp
    player2 = Player.new(name2)
    puts "------------------------------"
    game_board = GameBoard.new
    game_board.draw_board
    puts game_board.board
    puts "------------------------------"
    puts "Player #{player1.name} please input position:"
    pos = gets.chomp
    until pos.to_s.match?(/\b[1-9]\b/)
      puts "Invalid position, please input again: "
      pos = gets.chomp
    end
    type = "X"
    name = player1.name
    until game_board.update_board(pos, type, name)
      type = type == "X" ? "O" : "X"
      name = name == player1.name ? player2.name : player1.name
      puts "Player #{name} please input position:"
      pos = gets.chomp
    end
    puts "Do you want to play new game? (Y/N): "
    want = gets.chomp
    return if want.downcase != "y"
    start
  end
end
