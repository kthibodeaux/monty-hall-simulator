module Monty
  class DoorAggregator

    def initialize(number_of_doors = 3)
      @number_of_doors = number_of_doors
    end

    def doors
      @doors ||= door_numbers.map do |door_number|
        if winning_door_number == door_number
          DoorFactory.winning_door(door_number)
        else
          DoorFactory.losing_door(door_number)
        end
      end
    end

    def door_numbers
      1.upto(@number_of_doors).map { |n| n }
    end

    def losing_doors
      doors.select(&:loser?)
    end

    def winning_door
      doors.detect(&:winner?)
    end

    private

    def winning_door_number
      @winning_door_number ||= door_numbers.sample
    end

  end
end
