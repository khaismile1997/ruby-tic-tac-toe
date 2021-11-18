class GameBoard
  attr_reader :board
  def initialize
    @board = Array.new
    @current_board = Array.new
  end
  
  def draw_board
    count = 1
    (0...7).each do |i|
      p_board = ""
      (0...13).each do |j|
        if (i.zero? && j.zero?) || (i.even? && j.even?) || (i.odd? && (j.zero? || j%4 == 0))
          p_board += "*"
        elsif (i.odd? && (j%2==0 && j%4!=0))
          p_board += count.to_s
          count+=1
        else
          p_board += " "
        end
      end
      @board << p_board
    end
  end

  def update_board(pos, type, name)
    until pos.to_s.match?(/\b[1-9]\b/) && @current_board[pos.to_i].nil?
      puts "Invalid position, please input again: "
      pos = gets.chomp
    end
    @board.each_with_index do |b, i|
      next if i.even? || i.zero?
      b.sub!(pos, type)
    end
    @current_board[pos.to_i] = type
    puts @board

    if check_win(type)
      puts "Player #{name} WIN!"
      true
    elsif @current_board.size > 9
      puts "The game ended in a draw!"
      true
    else
      false
    end
  end

  private

  def check_win(type)
    if [
        @current_board[1],
        @current_board[2],
        @current_board[3]
    ].all?{_1 == type}
      true
    elsif [
      @current_board[4],
      @current_board[5],
      @current_board[6]
    ].all?{_1 == type}
      true
    elsif [
      @current_board[7],
      @current_board[8],
      @current_board[9]
    ].all?{_1 == type}
      true
    elsif [
      @current_board[1],
      @current_board[4],
      @current_board[7]
    ].all?{_1 == type}
      true
    elsif [
      @current_board[2],
      @current_board[5],
      @current_board[8]
    ].all?{_1 == type}
      true
    elsif [
      @current_board[3],
      @current_board[6],
      @current_board[9]
    ].all?{_1 == type}
      true
    elsif [
      @current_board[1],
      @current_board[5],
      @current_board[9]
    ].all?{_1 == type}
      true
    elsif [
      @current_board[3],
      @current_board[5],
      @current_board[7]
    ].all?{_1 == type}
      true
    elsif
      false
    end
  end
end
