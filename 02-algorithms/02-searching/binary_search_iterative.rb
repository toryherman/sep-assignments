def binary_iterative(collection, value)
  low = 0
  high = collection.length - 1

  while low <= high
    mid = (low + high) / 2
    if collection[mid] < value
      low = mid + 1
    elsif collection[mid] > value
      high = mid - 1
    else
      return mid
    end
  end
end
