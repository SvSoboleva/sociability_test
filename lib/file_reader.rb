class FileReader
  def initialize(file_name)
    current_path = File.dirname(__FILE__)
    @file_path = current_path + '/../' + file_name
  end

  def exist?
    File.exist?(@file_path)
  end

  def to_array
    File.readlines(@file_path, encoding: 'UTF-8')
  end
end
