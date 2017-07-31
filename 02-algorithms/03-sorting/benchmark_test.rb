require_relative 'quick_sort'
require_relative 'heap_sort'
require_relative 'bucket_sort'
require 'benchmark'

arr1 = []
arr2 = []
arr3 = []
100_000.times do
  arr1.push(Random.rand(100_000))
  arr2.push(Random.rand(100_000))
  arr3.push(Random.rand(100_000))
end

Benchmark.bm do |x|
  x.report("quick sort 100_000 item array:") { quick_sort(arr1) }
  x.report("heap sort 100_000 item array:") { heap_sort(arr2) }
  x.report("bucket sort 100_000 item array:") { bucket_sort(arr3) }
end
