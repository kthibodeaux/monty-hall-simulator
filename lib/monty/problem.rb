module Monty
  class Problem

    def choose_random
      @first_choice = available_doors.sample
      delete_random_door_that_is_not(@first_choice)
      choose @first_choice
    end

    def choose_same_door
      @first_choice
    end

    def choose_other_door
      @second_choice = available_doors.detect { |d| d != @first_choice }
      choose @second_choice
    end

    private

    def doors
      door_aggregator.doors
    end

    def available_doors
      @available_doors ||= doors
      @available_doors.compact
    end

    def choose(door)
      available_doors.delete(door)
      door
    end

    def delete_random_door_that_is_not(door)
      @available_doors.delete(random_losing_door(door))
    end

    def random_losing_door(chosen)
      door_aggregator.losing_doors.reject { |d| d == chosen }.sample
    end

    def door_aggregator
      @door_aggregator ||= DoorAggregator.new
    end

  end
end
