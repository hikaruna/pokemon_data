require 'yaml'
require 'csv'

def puts_tag tag
  puts "<#{tag}>"
  yield
  puts "</#{tag}>"
end

puts_tag :table do
  data = YAML.load $stdin
  puts_tag :thead do
    puts_tag :tr do
      data[1].keys.each do |key|
        puts_tag :td do
          puts key
        end
      end
    end
  end
  puts_tag :tbody do
    data.each do |monster|
      puts_tag :tr do
        monster.values.each do |value|
          puts_tag :td do
            puts value
          end
        end
      end
    end
  end
end
