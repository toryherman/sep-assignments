class City
  attr_reader :name
  attr_accessor :visited
  attr_accessor :neighbors

  def initialize(name)
    @name = name
    @visited = false
    @neighbors = []
  end
end

def nearest_neighbor(cities, origin)
  current_city = origin
  route = [origin.name]

  while !current_city.visited
    # only get neighbors passed in by cities argument
    neighbor_cities = []
    for city in current_city.neighbors
      neighbor_cities << city if cities.include? city[:city]
    end

    # set initial next_city to first unvisited neighbor
    for city in neighbor_cities
      if !city[:city].visited
        next_city = city
        break
      end
    end

    # exit while loop if no more unvisited neighbors
    break if current_city == next_city[:city]

    for current_neighbor in neighbor_cities
      if current_neighbor[:distance] < next_city[:distance] && !current_neighbor[:city].visited
        next_city = current_neighbor
      end
    end

    current_city.visited = true
    current_city = next_city[:city]
    route << current_city.name
  end

  route
end
