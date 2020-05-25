class Question
  attr_accessor :answer, :display_question

  def initialize
    @first = rand(1..20)
    @second = rand(1..20)
    @answer = @first + @second
    @display_question = "What does #{@first} plus #{@second} equals to?"
  end
end