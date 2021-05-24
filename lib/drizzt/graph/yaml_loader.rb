require 'yaml'

module YamlLoader

  def load_flat_table(file_path)
    table = YAML.load_file file_path

    input_weighted_table table.map{ |e| [e[0], e[1], 1] }
  end

end