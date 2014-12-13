module Monty
  class Simulation

    def initialize(strategy = :switch)
      @strategy = strategy
    end

    def run
      choose_first_door
      choose_second_door
    end

    def won?
      @second_door.winner?
    end

    private

    def choose_first_door
      @first_door = problem.choose_random
    end

    def choose_second_door
      if switch?
        @second_door = problem.choose_other_door
      else
        @second_door = problem.choose_same_door
      end
    end

    def switch?
      @strategy == :switch
    end

    def problem
      @problem ||= Monty::Problem.new
    end

  end
end
