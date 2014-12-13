$LOAD_PATH << File.join(File.expand_path('.'), 'lib')
require 'monty'

switch_runner = Monty::SimulationRunner.new(:switch)
stay_runner = Monty::SimulationRunner.new(:stay)

print 'Running simulations...'
switch_runner.run
stay_runner.run

puts ''
switch_runner.print_results
stay_runner.print_results
