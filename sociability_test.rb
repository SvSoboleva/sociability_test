if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "./lib/test"
require_relative "./lib/result"
require_relative "./lib/file_reader"

user_name = ARGV[0]

if Gem.win_platform? && ARGV[0]
  user_name = user_name.encode("UTF-8")
end

if user_name == nil
  user_name = 'Таинственная персона'
end

#подготовка данных для теста - вопросы и ответы
file_questions = FileReader.new('data/questions.txt')
file_results = FileReader.new('data/results.txt')

if file_questions.exist? && file_results.exist?
  questions = file_questions.to_array
  results = file_results.to_array
else
  abort "Файл не найден"
end

puts "Добрый день, #{user_name}! Ответьте, пожалуйста, честно на несколько " \
"вопросов, чтобы узнать кое-что о себе."

test = Test.new(questions)
test_result = Result.new(results)

until test.end_of_test?
  test.next_question
end

test_result.print_result(test)