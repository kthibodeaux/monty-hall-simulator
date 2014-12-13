module Monty
  class Door
    attr_reader :id

    def initialize(id, type)
      @id = id
      @type = type
    end

    def winner?
      @type == :winner
    end

    def loser?
      ! winner?
    end

  end

end
