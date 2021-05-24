module TableLoader

  def input_weighted_table(table)
    table.each do |row|
      @nodes << row[0]
      @nodes << row[1]
      @edges[row[0]] ||= {}
      @edges[row[0]][row[1]] = row[2]
    end
  end

  def input_flat_table(table)
    input_weighted_table table.map{ |e| [e[0], e[1], 1] }
  end

end