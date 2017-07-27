class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :visited

  def initialize(name)
    self.name = name
    self.film_actor_hash = Hash.new()
    self.visited = false
  end
end
