# Ruby Log Parser

## About

Takes a `.log` file of the following format `url ip_address` e.g; `/about/meet-the-team 123.123.123.123` and returns a count of all unique visits of each page.

## How?

The main workhorse is the `/lib/parser.rb` class. This is a simple parser responsible for crunching the numbers of the log file in various ways. You can initialise a new parser with `parser = Parser.new("path/to/your/logfile.log")`. Once this is done you can call a variety of methods to pull out information about the log...

- `.file` - returns the raw logfile
- `.log` - Returns the log as a two dimensional array `[[page, ip_address]]`
- `.pages` - Returns a list of unique page urls in the logfile
- `.page_views` - Returns a hash of page urls (as keys) with their assosciated view count (as values)
- `.unique_page_views` - Returns a hash of page urls (as keys) with their assosciated unique (by IP address) view count (as values)

## Tests

Run `rspec` in the console to run the test suite

## Run

`ruby log_parser.rb webserver.log`
