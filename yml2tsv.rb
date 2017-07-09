require 'yaml'
require 'csv'

CSV($stdout, col_sep: "\t") do |tsv|
  data = YAML.load $stdin
  tsv << data[1].keys
  data.each do |monster|
    tsv << monster.values
  end
end
