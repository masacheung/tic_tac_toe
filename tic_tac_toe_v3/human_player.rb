class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        p "Enter the position: "
        position = gets.chomp.split.map(&:to_i)
        raise "Please input 2 number" if position.length != 2
        while !legal_positions.include?(position)
            p "#{position} is not a legal position"
            p "Enter the position: "
            position = gets.chomp.split.map(&:to_i)
        end
        position
    end

end