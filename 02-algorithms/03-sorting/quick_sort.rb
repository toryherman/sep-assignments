def quick_sort(collection)
  if collection.length <= 1
    collection
  else
    pivot_index = rand(0..collection.length-1)
    pivot_val = collection[pivot_index]
    lower = []
    higher = []

    for i in 0..collection.length - 2
      if collection[i] >= pivot_val
        higher << collection[i]
      else
        lower << collection[i]
      end
    end

    quick_sort(lower) + [pivot_val] + quick_sort(higher)
  end
end
