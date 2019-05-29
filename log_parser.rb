# Run the script
# log_parser = LogParser.new(file)
# views = parser.unique_page_views
# views.sort_by {|k,v| v}.reverse
# [["/index", 23], ["/home", 23]] etc...
require './lib/parser.rb'

if ARGV.length > 0
  ARGV.each do |filename|
    parser  = Parser.new(filename)
    views   = parser.unique_page_views
    views   = views.sort_by {|k, v| v}.reverse

    puts "---------------------------------"
    puts "Unique page views for #{filename}:"
    puts "---------------------------------"
    views.each do |k,v|
      puts "#{k} #{v} visits"
    end
  end
else
  raise ArgumentError, "must pass in the path to a valid .log file"
end



