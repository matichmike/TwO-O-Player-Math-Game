require_relative "./player.rb"
require_relative "./question.rb"

class Game

  # def intialize
  #   # @first_player = Player.new
  #   # @second_player = Player.new
  #   @players = [@first_player, @second_player].shuffle
  # end

  def run  
    print "Welcome to the most unforgiving game on the market!"
    print "First combatanat, reveal your identity! "
    first_player_name = gets.chomp.to_s
    print "Second combatant, reveal your identity! "
    second_player_name = gets.chomp.to_s

    @first_player = Player.new(first_player_name)
    @second_player = Player.new(second_player_name)

    until (@first_player.dead? || @second_player.dead?) do
      # first way
      current_player = (current_player == @first_player) ? @second_player : @first_player 
      #second way (alternative)
      # current_player = @players.first
      question = Question.new()
      puts "----- NEW TURN -----"
      puts "#{current_player.name}: #{question.display_question}"
      answer = gets.chomp.to_i
      if answer == question.answer
        puts "YES! You are correct."
        puts "#{@first_player.name} #{@first_player.lives}/3 lives and #{@second_player.name} #{@second_player.lives}/3"
      else current_player.lives -= 1
        puts "Seriously? No!"
        puts "#{@first_player.name} #{@first_player.lives}/3 lives and #{@second_player.name} #{@second_player.lives}/3"
      end
      # @players.rotate!
    end
    
    if @first_player.dead?
      puts "#{@second_player.name} wins with a score of #{@second_player.lives}/3"
    elsif     
      @second_player.dead?
      puts "#{@first_player.name} wins with a score of #{@first_player.lives}/3"
    end
    puts "----- GAME OVER -----"
    end
end