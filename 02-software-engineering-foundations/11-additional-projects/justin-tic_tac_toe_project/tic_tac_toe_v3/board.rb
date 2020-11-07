class Board
    attr_reader :grid

    def initialize(n)
        @n = n
        @grid = Array.new(@n) { Array.new(@n, "_")}
    end

    def valid?(position)
        position[0] >= 0 && position[0] <= @n - 1 && position[1] >= 0 && position[1] <= @n - 1
    end

    def empty?(position)
        @grid[position[0]][position[1]] == '_'
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            @grid[position[0]][position[1]] = mark
        else
            raise "the position have problem"
        end
    end

    def print
        @grid.each { |row| p row }
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all? { |el| el == mark }
        end
    end

    def win_col?(mark)
        @grid.transpose.any? do |row|
            row.all? { |el| el == mark }
        end
    end

    def win_diagonal?(mark)
        diagonal = []
        anti_diagonal = []
        (0...@grid.length).each do |i|
            diagonal << @grid[i][i]
            anti_diagonal << @grid[i][-i - 1]            
        end
        diagonal.uniq == [mark] || anti_diagonal.uniq == [mark]
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? do |row|
            row.any? { |el| el == "_" }
        end
    end

    def legal_positions
        empty_positions = []
        @grid.each_with_index do |row, i|
            row.each_with_index do |el, j|
                empty_positions << [i, j] if el == "_"
            end
        end
        empty_positions
    end
end