class Parser
  attr_reader :file

  def initialize(file)
    @file = read_file(file)
  end

  def log(separator=" ")
    parse_lines(@file, separator)
  end

  def pages
    log.map(&:first).uniq
  end

  def page_views
    log.group_by(&:first).transform_values(&:count)
  end

  def unique_page_views
    log.group_by(&:first).transform_values {|v| v.uniq.count }
  end

  private
    def read_file(file)
      if File.extname(file) == '.log'
        File.readlines(file)
      else
        raise ArgumentError, "Invalid file type, you must provide a valid .log file"
      end
    end

    def parse_lines(file, separator)
      file.map {|line| line.split(separator) }
    end
end


