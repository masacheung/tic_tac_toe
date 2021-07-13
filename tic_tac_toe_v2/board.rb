class Board
    def initialize(number)
        @grid = Array.new(number) {Array.new(number, '_')}
    end

    def valid?(position)
        if position[0] >= 0 && position[0] < @grid.length
            if position[1] >= 0 && position[1] < @grid.length
                return true
            end
        end
        false
    end

    def empty?(position)
        return true if @grid[position[0]][position[1]] == '_'
        false
    end

    def place_mark(position, mark)
        raise "invalid mark" if !valid?(position) || !empty?(position)
        @grid[position[0]][position[1]] = mark
    end

    def print
        @grid.each do |subarr|
            p subarr.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? {|row| row.all?(mark)}
    end

    def win_col?(mark)
        (0...@grid.length).each do |i|
            col = true
            (0...@grid.length).each do |j|
                col = false if @grid[j][i] != mark
            end
            return true if col == true
        end  
        return false
    end

    def win_diagonal?(mark)
        dia = true
        (0...@grid.length).each do |i|
            dia = false if @grid[i][i] != mark
        end

        return true if dia == true

        dia = true
        (1..@grid.length).each do |j|
            dia = false if @grid[-j][-j] != mark
        end

        return true if dia == true
        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? {|subarr| subarr.any?('_')}
    end
end