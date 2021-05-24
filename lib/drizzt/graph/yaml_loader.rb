require 'yaml'

module YamlLoader

  def load_flat_table(file_path)
    hash = YAML.load_file file_path

    w_table = []
    hash.each do |source, dests|
      dests.each do |dest, _|
        w_table << [source, dest, 1]
      end
    end

    input_weighted_table w_table
  end

end