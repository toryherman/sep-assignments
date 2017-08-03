def linear_search(array, target)
  n = array.length
  puts "n: #{n}"
  array.each_with_index do |element, i|
    if element == target
      return i
    end
  end
  return nil
end
