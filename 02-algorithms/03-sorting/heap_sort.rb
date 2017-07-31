def heap_sort(collection)
  n = collection.length

  # heapify starting with last parent node
  (n/2 - 1).downto(0) do |i|
    heapify(collection, n, i)
  end

  # swap last node with root (max)
  # move highest value to end of array
  # reorganize heap with remaining nodes
  (n-1).downto(1) do |i|
    temp = collection[0]
    collection[0] = collection[i]
    collection[i] = temp
    heapify(collection, i, 0)
  end

  collection
end

def heapify(collection, n, i)
  max = i
  l = 2 * i + 1
  r = 2 * i + 2

  if l < n && collection[max] < collection[l]
    max = l
  end

  if r < n && collection[max] < collection[r]
    max = r
  end

  if max != i
    temp = collection[max]
    collection[max] = collection[i]
    collection[i] = temp
    heapify(collection, n, max)
  end
end
