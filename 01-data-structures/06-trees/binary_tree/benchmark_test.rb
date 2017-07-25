require_relative 'node'
require_relative 'binary_search_tree'
require 'benchmark'

root = Node.new(1, 1)
tree = BinarySearchTree.new(root)
arr = []
nodes = []
new_node = Node.new(5000, 5000)

for i in 2..10000 do
  x = Node.new(i, i)
  nodes << x
end

Benchmark.bm do |x|
  x.report("create 10,000 item binary tree:") { for i in 0..9998 do tree.insert(root, nodes[i]); a = 1; end }
  x.report("find item 5,000 in binary tree:") { tree.find(root, 5000) }
  x.report("delete item 5,000 from binary tree:") { tree.delete(root, 5000) }
  x.report("insert item 5,000 into binary tree:") { tree.insert(root, new_node) }
end
