class Result
  def initialize
    current_path = File.dirname(__FILE__)
    file_results = current_path + '/data/results.txt'

    if File.exist?(file_results)
      #puts "Открыли файл : #{file_path}"
      file = File.new(file_results, "r:UTF-8")
      @results = file.readlines
      file.close
    else
      abort "Файл #{file_results} не найден"
    end
  end
  
  def print_result(test)
    puts "Количество набранных баллов :  #{test.total}"
    case test.total
      when 32
        puts "Вы отвечали не совсем честно или были невнимательны при выборе ответа.
        Пройдите тест еще раз."
      when 30..31
        puts @results[0]
      when 25..29
        puts @results[1]
      when 19..24
        puts @results[2]
      when 14..18
        puts @results[3]
      when 9..13
        puts @results[4]
      when 4..8
        puts @results[5]
      when 0..3
        puts @results[6]
    end
  end 
end