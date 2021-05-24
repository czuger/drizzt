module TableLoader

  def load_weighted_table(table)
    table.each do |row|
      @nodes << row[0]
      @nodes << row[1]
      @edges[row[0]] ||= {}
      @edges[row[0]][row[1]] = row[2]
      p @edges
    end
  end

  def load_flat_table(table)
    load_weighted_table table.map{ |e| [e[0], e[1], 1] }
  end

end