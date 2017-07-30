require_relative 'fibonacci_iterative'
require 'benchmark'

Benchmark.bm do |x|
  x.report("fibonacci iterative fib(20):") { fib(20) }
end
