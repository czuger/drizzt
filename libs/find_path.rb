require_relative 'graph'

def find_next_dest_to_goal( current_position_code_name, goal_code_name, exclusion_cities_codes_names = [] )

  map = Graph.new

  raise 'Goal is nil' unless goal_code_name

  current_position_code_name = current_position_code_name.to_sym
  goal_code_name = goal_code_name.to_sym

  frontier = []
  frontier << current_position_code_name
  came_from = {}
  came_from[ current_position_code_name ] = nil

  until frontier.empty?
    current_name = frontier.shift

    if current_name == goal_code_name
      break
    end

    map.next_location( current_name ).each do |next_location|
      next if exclusion_cities_codes_names.include?( next_location.to_s )

      unless came_from.has_key?( next_location )
        frontier << next_location
        came_from[ next_location ] = current_name
      end
    end
  end

  back_token = goal_code_name
  next_step = nil
  distance = 0

  # pp came_from

  path = [back_token]

  while back_token != current_position_code_name
    next_step = back_token
    # p next_step
    back_token = came_from[ back_token ]
    path << back_token
    distance += 1
    break if next_step == nil
  end

  { from: current_position_code_name, to: goal_code_name,
    next_step: next_step, distance: distance, path: path.reverse  }
end