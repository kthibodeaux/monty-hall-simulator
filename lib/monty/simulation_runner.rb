module Monty
  class SimulationRunner
    attr_reader :strategy, :played, :won

    def initialize(strategy)
      @strategy = strategy
      @played = 0
      @won = 0
    end

    def run
      Monty.times_to_run.times do
        simulation = new_simulation
        simulation.run
        increment_played
        increment_won if simulation.won?
        print_a_dot
      end
      self
    end

    def print_results
      puts "#{ strategy } won: #{ won } / #{ played } (Used #{ Monty.number_of_doors } doors)"
    end

    private

    def new_simulation
      Simulation.new(strategy)
    end

    def increment_played
      @played += 1
    end

    def increment_won
      @won += 1
    end

    def print_a_dot
      print '.' if Monty.verbose? && played % 1000 == 0
    end

  end
end
