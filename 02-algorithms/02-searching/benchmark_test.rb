require_relative 'fibonacci_recursive'
require 'benchmark'

Benchmark.bm do |x|
  x.report("fibonacci recursive fib(20):") { fib(20) }
end
