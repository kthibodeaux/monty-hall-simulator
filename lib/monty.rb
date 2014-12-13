require 'monty/door'
require 'monty/door_factory'
require 'monty/door_aggregator'
require 'monty/problem'
require 'monty/simulation'
require 'monty/simulation_runner'

module Monty

  VERSION = '0.0.1'

  def self.root
    File.expand_path('../..', __FILE__)
  end

end
