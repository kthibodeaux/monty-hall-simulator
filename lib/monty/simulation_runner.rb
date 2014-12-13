module Monty
  class SimulationRunner
    attr_reader :strategy, :played, :won

    def initialize(strategy = :switch)
      @strategy = strategy
      @played = 0
      @won = 0
    end

    def run(times_to_run)
      times_to_run.times do
        simulation = new_simulation
        simulation.run
        increment_played
        increment_won if simulation.won?
        print_a_dot
      end
      self
    end

    def print_results
      puts "#{ strategy } won: #{ won } / #{ played }"
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
      print '.' if ! ARGV.include?('--no-progress') && played % 1000 == 0
    end

  end
end
