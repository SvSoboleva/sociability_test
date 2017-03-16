require_relative "./lib/test"
require_relative "./lib/result"

current_path = File.dirname(__FILE__)
user_name = ARGV[0]

if Gem.win_platform? && ARGV[0]
  user_name = user_name.encode("UTF-8")
end

if user_name == nil
  user_name = 'Таинственная персона'
end

puts "Добрый день, #{user_name}! Ответьте, пожалуйста, честно на несколько " \
"вопросов, чтобы узнать кое-что о себе."

test = Test.new(current_path)
test_result = Result.new(current_path)

until test.end_of_test?
  test.next_question
end

test_result.print_result(test)