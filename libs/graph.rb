require 'yaml'

class Graph
  def initialize
    @locations = YAML.load_file('libs/locations.yml')
    @weight_table = {}
  end

  def next_location(location)
    @locations[location]
  end

  def nodes
    @locations.keys
  end

  def weight(node_dest)
    @weight_table[node_dest] || 1
  end

  def add_weight(node_dest, weight)
    @weight_table[node_dest] = weight
  end
end