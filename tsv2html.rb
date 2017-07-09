require 'csv'
require 'erb'

def puts_tag tag
  puts "<#{tag}>"
  yield
  puts "</#{tag}>"
end

CSV($stdin, col_sep: "\t", headers: :first_row) do |tsv|
  data = CSV::Table.new(tsv.map{|i|i})

  puts_tag :table do
    puts_tag :thead do
      puts_tag :tr do
        data.headers.each do |key|
          puts_tag :td do
            puts key
          end
        end
      end
    end
    puts_tag :tbody do
      data.each do |monster|
        puts_tag :tr do
          monster.fields.each do |value|
            puts_tag :td do
              puts value
            end
          end
        end
      end
    end
  end
end
