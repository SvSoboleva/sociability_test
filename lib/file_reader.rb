class FileReader
  def initialize(file_name)
    current_path = File.dirname(__FILE__)
    @file_path = current_path + '/../' + file_name
  end

  def exist?
    if File.exist?(@file_path)
      true
    else
      abort "Файл #{file_path} не найден"
    end
  end

  def to_array
    file = File.new(@file_path, "r:UTF-8")
    array_from_file = file.readlines
    file.close
    array_from_file
  end
end