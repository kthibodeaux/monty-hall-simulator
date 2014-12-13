$LOAD_PATH << File.join(File.expand_path('.'), 'lib')
require 'monty'

if ARGV.first.to_i > 0
  times_to_play = ARGV.first.to_i
else
  times_to_play = 1000
end

switch_runner = Monty::SimulationRunner.new(:switch)
stay_runner = Monty::SimulationRunner.new(:stay)

print 'Running simulations...'
switch_runner.run(times_to_play)
stay_runner.run(times_to_play)

puts ''
switch_runner.print_results
stay_runner.print_results
