require 'optparse'
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

  def self.options
    return @options if @options
    @options = {
      no_progress: false,
      times_to_run: 1000,
      number_of_doors: 3
    }

    OptionParser.new do |opts|
      opts.banner = "Usage: ruby bin/run.rb [options]"

      opts.on("--no-progress", "Hide printing . while processing") do |v|
        @options[:no_progress] = true
      end

      opts.on("-d", "--doors [NUMBER OF DOORS]", "Number of doors to use") do |doors|
        @options[:number_of_doors] = doors
      end

      opts.on("-t", "--times [TIMES TO RUN]", "Number of times to run each simulation set") do |times|
        @options[:times_to_run] = times.to_i
      end
    end.parse!
    @options
  end

  module_function

  def verbose?
    Monty.options[:no_progress] == false
  end

  def number_of_doors
    Monty.options[:number_of_doors].to_i
  end

  def times_to_run
    Monty.options[:times_to_run].to_i
  end

end
