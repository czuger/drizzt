require_relative 'graph'
require 'algorithms'
require 'set'

def solution(came_from, start, goal)
  back_token = goal
  distance = 0

  # pp came_from

  path = [back_token]

  while back_token != start
    next_step = back_token
    # p next_step
    back_token = came_from[ back_token ]
    path << back_token
    distance += 1
    break if next_step == nil
  end

  return { from: start, to: goal,
    next_step: next_step, distance: distance, path: path.reverse  }
end

def  find_path(graph, start, goal)
  dist = { start => 0 }
  prev = {}
  frontier = Containers::PriorityQueue.new()
  frontier.push(start, 0)
  explored = Set.new
  max_path = graph.nodes.count + 1

  graph.nodes.each do |node|
    if node != start
      dist[ node ] = Float::INFINITY
      prev[ node ] = nil
    end
  end

  until frontier.empty?
    node = frontier.pop
    # puts "PQ return #{node}"
    explored << node

    return solution(prev, start, goal) if node == goal

    graph.next_location(node).each do |neighbor|
      # puts "Exploring #{node} -> #{neighbor}"

      alt = dist[node] + graph.weight(neighbor)

      if alt < dist[neighbor] and not explored.include?(neighbor)
        dist[neighbor] = alt
        prev[neighbor] = node
        # puts "Pushing #{neighbor}, #{alt}"

        # Containers::PriorityQueue returns the max and we need the min.
        # However, we can assume that the max path is obviously the max number of nodes
        # Then as a priority we use max_path-dist
        frontier.push(neighbor, max_path-alt)
      end

    end
  end


end
