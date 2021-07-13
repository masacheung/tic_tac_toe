class ComputerPlayer
    attr_reader :mark

    def initialize(value)
        @mark = value
    end

    def get_position(legal_positions)
        choice = legal_positions.sample
        p "Computer #{@mark} chose position #{choice}"
        choice
    end
end