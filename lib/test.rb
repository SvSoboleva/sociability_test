class Test
  attr_reader :total

  def initialize(questions_array)
    @questions = questions_array

    @answer = '
    1. да
    2. нет
    3. иногда'

    @total = 0
    @current_question = 0
  end

  def next_question
    puts @questions[@current_question]
    puts @answer
    user_input = STDIN.gets.to_i

    until user_input.between?(1,3)
      puts "Введите 1, 2 или 3 и нажмите Enter"
      user_input = STDIN.gets.to_i
    end

    if user_input == 1
      @total += 2
    elsif user_input == 3
      @total += 1
    end

    @current_question += 1
  end

  def end_of_test?
    @current_question == @questions.size
  end
end