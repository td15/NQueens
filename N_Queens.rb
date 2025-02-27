class NQueens
  N = 8

  def self.solve_n_queens
    board = Array.new(N) { Array.new(N, '.') }
    solve_n_queens_util(board, 0)
  end

  def self.solve_n_queens_util(board, row)
    if row == board.length
      print_board(board)
      return
    end

    (0...board.length).each do |col|
      if is_safe(board, row, col)
        board[row][col] = 'Q' # Place queen
        solve_n_queens_util(board, row + 1) # Recur to place the rest
        board[row][col] = '.' # Backtrack
      end
    end
  end

  def self.is_safe(board, row, col)
    # Check this column on upper side
    (0...row).each do |i|
      return false if board[i][col] == 'Q'
    end

    # Check upper diagonal on left side
    (row).downto(0) do |i|
      j = col - (row - i)
      return false if j >= 0 && board[i][j] == 'Q'
    end

    # Check upper diagonal on right side
    (row).downto(0) do |i|
      j = col + (row - i)
      return false if j < board.length && board[i][j] == 'Q'
    end

    true
  end

  def self.print_board(board)
    board.each do |row|
      puts row.join(' ')
    end
    puts
  end
end

NQueens.solve_n_queens
