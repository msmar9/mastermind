require './mmmod.rb'
class MMGame
  include MMMod

  attr_reader :log, :last_feedback, :turn, :key

  def initialize(key)
    @key = key
    @log = ""
    @turn = 0
    @last_feedback = ""
  end

  def try(key)
    @turn += 1
    feedback = compare_keys(@key, key)
    @log += "Turn #{@turn} | #{key} | #{feedback}\n"
    @last_feedback = feedback
  end

  def over?
    @log.end_with?("xxxx\n")
  end
end

# Testing

#game = MMGame.new('3365')
#game.try('6632')
#puts game.log
#p game.over?
#game.try('3365')
#puts game.log
#p game.over?