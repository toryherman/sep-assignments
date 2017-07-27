require_relative 'node'

class Graph
  def find_kevin_bacon(kevin, node)
    node.visited = true
    path = []

    node.film_actor_hash.each do |movie, cast|
      if cast.include?(kevin)
        path << movie
        return path
      end
    end

    node.film_actor_hash.each do |movie, cast|
      if !path.include?(movie)
        cast.each do |actor|
          if !actor.visited
            path << movie
            x = find_kevin_bacon(kevin, actor)
            if x
              path += x
              return path
            end
          end
        end
      end

      # removes movie from path if cast doesn't lead to connection
      path.pop
    end

    nil
  end

  def reset_nodes(nodes_array)
    nodes_array.each do |actor|
      actor.visited = false
    end
  end
end
