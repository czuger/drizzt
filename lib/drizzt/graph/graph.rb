require 'yaml'
require 'ostruct'
require 'set'

require_relative 'find_path'
require_relative 'table_loader'
require_relative 'yaml_loader'

class DrizztGraph
  attr_reader :nodes

  include TableLoader
  include FindPath
  include YamlLoader

  def initialize
    @nodes = Set.new
    @edges = {}
  end

  def neighbors(node_src)
    raise StandardError.new("#{node_src} not in #{@edges}") unless @edges[node_src]
    @edges[node_src].keys
  end

  def weight(node_src, node_dest)
    @edges[node_src][node_dest]
  end

  # This allow to modify the weight of all the edge leading to a node.
  def weight_node(node, weight)
    @edges.each do |source, dests|
      dests.each do |dest, _|
        if dest == node
          @edges[source][dest] = weight
        end
      end
    end
  end
end