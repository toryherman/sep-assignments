def binary_recursive(collection, value, low=0, high=collection.length-1)
  mid = (low + high) / 2

  if collection[mid] == value
    return mid
  elsif low > high
    return nil
  else
    if collection[mid] < value
      low = mid + 1
    else
      high = mid - 1
    end

    binary_recursive(collection, value, low, high)
  end
end
