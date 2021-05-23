require 'yaml'

class Graph
  def initialize
    @locations = YAML.load_file('libs/locations.yml')
  end

  def next_location(location)
    @locations[location]
  end
end