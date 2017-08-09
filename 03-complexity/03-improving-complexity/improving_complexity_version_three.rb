# This method takes n arrays as input and combine them in sorted ascending order
def combine_selection_sort(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array += array
  end
  selection_sort(combined_array)
end

def selection_sort(collection)
  length = collection.length
  for i in 0..length-2
    min_index = i
    for j in (i + 1)...length
      if collection[j] < collection[min_index]
        min_index = j
      end
    end
    temp = collection[i]
    collection[i] = collection[min_index]
    collection[min_index] = temp
  end
  collection
end
