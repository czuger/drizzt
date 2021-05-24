require 'yaml'
require 'ostruct'
require 'set'

require_relative 'find_path'
require_relative 'table_loader'

class DrizztGraph
  attr_reader :nodes

  include TableLoader
  include FindPath

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
end