def bucket_sort(collection)
  result = []
  n = collection.length
  k = collection.max

  buckets = Array.new(n)
  for i in 0...n do
    buckets[i] = []
  end

  collection.each do |val|
    index = (val * n) / (k + 1)
    buckets[index].push(val)
  end

  buckets.each do |subarray|
    result += insertion_sort(subarray) if !subarray.empty?
  end

  result
end

def insertion_sort(collection)
  sorted = [collection.delete_at(0)]

  for val in collection
    i = 0

    while i < sorted.length
      if val <= sorted[i]
        sorted.insert(i, val)
        break
      elsif i == sorted.length - 1
        sorted.insert(i + 1, val)
        break
      end

      i += 1
    end
  end

  sorted
end
