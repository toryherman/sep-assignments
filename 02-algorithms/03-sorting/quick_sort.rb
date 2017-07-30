def quick_sort(collection)
  collection.compact!
  
  if collection.length <= 1
    collection
  else
    pivot = collection.length - 1

    for i in 0..collection.length - 2
      if collection[i] > collection[pivot]
        collection.insert(pivot + 1, collection[i])
        collection[i] = nil
      end
    end

    collection = quick_sort(collection[0..pivot-1]) + quick_sort(collection[pivot..collection.length-1])
  end
end
