require_relative 'node'
require_relative 'heap'
require 'benchmark'

root = Node.new(1, 1)
heap = Heap.new(root)
arr = []
nodes = []
new_node = Node.new(5000, 5000)

for i in 2..10000 do
  x = Node.new(i, i)
  nodes << x
end

Benchmark.bm do |x|
  x.report("create 10,000 item heap:") { for i in 0..9998 do heap.insert(heap.root, nodes[i]); a = 1; end }
  x.report("find item 5,000 in heap:") { heap.find(heap.root, 5000) }
  x.report("delete item 5,000 from heap:") { heap.delete(heap.root, 5000) }
  x.report("insert item 5,000 into heap:") { heap.insert(heap.root, new_node) }
end
