class Board
  attr_accessor :grid
  def initialize
    @grid =  [
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", "X", " ", " ", " "],
      [" ", " ", " ", " ", "X", " ", " "],
      [" ", " ", " ", " ", " ", "X", " "],
      [" ", " ", " ", " ", " ", " ", "X"]
    ]
  end

  def board
    print %{
             c1   c2  c3  c4  c5  c6  c7
        r1  | #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]} | #{@grid[0][3]} | #{@grid[0][4]} | #{@grid[0][5]} | #{@grid[0][6]} |
        r2  | #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]} | #{@grid[1][3]} | #{@grid[1][4]} | #{@grid[1][5]} | #{@grid[1][6]} |
        r3  | #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]} | #{@grid[2][3]} | #{@grid[2][4]} | #{@grid[2][5]} | #{@grid[2][6]} |
        r4  | #{@grid[3][0]} | #{@grid[3][1]} | #{@grid[3][2]} | #{@grid[3][3]} | #{@grid[3][4]} | #{@grid[3][5]} | #{@grid[3][6]} |
        r5  | #{@grid[4][0]} | #{@grid[4][1]} | #{@grid[4][2]} | #{@grid[4][3]} | #{@grid[4][4]} | #{@grid[4][5]} | #{@grid[4][6]} |
        r6  | #{@grid[5][0]} | #{@grid[5][1]} | #{@grid[5][2]} | #{@grid[5][3]} | #{@grid[5][4]} | #{@grid[5][5]} | #{@grid[5][6]} |
    }
  end

  def self.updateCell(row, col, symbol)
    @grid[row][col] = symbol
  end

  def ck_win_hztl?(row, col, symbol)
    pointer_to_right = 0
    pointer_to_left = 4
    col_to_right = col
    col_to_left = col
    going_right = []
    going_left = []
    win = Array.new(4, symbol)

    while pointer_to_right < 4
      going_right.push(@grid[row][col_to_right])
      col_to_right += 1
      break if col_to_right > 6
      pointer_to_right += 1
    end

    while pointer_to_left > 0
      going_left.push(@grid[row][col_to_left])
      col_to_left -= 1
      break if col_to_left < 0
      pointer_to_left -= 1
    end

    going_right == win || going_left == win
  end

  def ck_win_vtcl?(row, col, symbol)
    pointer_up = 4
    pointer_down = 0
    row_up = row
    row_down = row
    go_up = []
    go_down = []
    win = Array.new(4, symbol)

    while pointer_up > 0
      go_up.push(@grid[row_up][col])
      row_up -= 1
      break if row_up < 0
      pointer_up -= 1
    end

    while pointer_down < 4
      go_down.push(@grid[row_down][col])
      row_down += 1
      break if row_down > 5
      pointer_down += 1
    end

    go_up == win || go_down == win
  end

  def ck_win_ur?(row, col, symbol)
    #up and right = decrement row increment col
    times = 4
    up_right = []
    win = Array.new(4, symbol)

    while times > 0
      up_right.push(@grid[row][col])
      row -= 1
      break if row < 0
      col += 1
      break if col> 6
      times -= 1
    end
    
    up_right == win
  end

  def ck_win_dl?(row, col, symbol)
    #inc row dec col
    times = 4
    down_left = []
    win = Array.new(4, symbol)

    while times > 0
      down_left.push(@grid[row][col])
      row += 1
      break if row > 5
      col -= 1
      break if col < 0
      times -= 1
    end

    down_left == win
  end

  def ck_win_dr?(row, col, symbol)
    #down and right = increment row increment col
    times = 4
    down_right = []
    win = Array.new(4, symbol)

    while times > 4
      down_right.push(@grid[row][col])
      row += 1
      break if row > 5
      col += 1
      break if col > 6
      times -= 1
    end

    down_right == win
  end

  def ck_win_ul?(row, col, symbol)
    times = 4
    up_left = []
    win = Array.new(4, symbol)

    while times > 0
      up_left.push(@grid[row][col])
      row -= 1
      break if row < 0
      col -= 1
      break if col < 0
      times -= 1
    end

    up_left == win
  end

  def win?(row, col, symbol)
    ck_win_dl?(row, col, symbol) ||
    ck_win_dr?(row, col, symbol) ||
    ck_win_ul?(row, col, symbol) ||
    ck_win_ur?(row, col, symbol) ||
    ck_win_hztl?(row, col, symbol) ||
    ck_win_vtcl?(row, col, symbol)
  end
end