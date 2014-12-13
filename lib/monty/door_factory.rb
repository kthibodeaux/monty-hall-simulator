module Monty
  class DoorFactory

    def self.winning_door(id)
      Door.new(id, :winner)
    end

    def self.losing_door(id)
      Door.new(id, :loser)
    end

  end
end
