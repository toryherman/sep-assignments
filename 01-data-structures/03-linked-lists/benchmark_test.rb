require_relative 'node'
require_relative 'linked_list'
require 'benchmark'

llist = LinkedList.new
arr = []
nodes = []

for i in 0..9999 do
  x = Node.new(i)
  nodes << x
end

Benchmark.bm do |x|
  x.report("create array:") { for i in 0..9999 do arr << i; a = 1; end }
  x.report("create linked list:") { for i in 0..9999 do llist.add_to_tail(nodes[i]); a = 1; end }
  x.report("delete 5000th elem from array:") { arr.delete_at(5000) }
  x.report("delete 5000th elem from linked list:") { llist.delete(5000) }
end
