require './mmmod.rb'
require './mmgame.rb'
def play_mastermind
  include MMMod

  role = ask_role
  if role == '1'
    play_codemaker
  elsif role == '2'
    play_codebreaker
  end
end

def play_codemaker
  include MMMod

  key = ask_key
  game = MMGame.new(key)
  game.try('1100')
  puts game.log
end

def play_codebreaker
  include MMMod

  game = MMGame.new(generate_key)
  while !game.over? && game.turn < 12
    key = ask_key
    game.try(key)
    puts game.log
  end
  puts ( game.log.end_with?('xxxx') ? 'YOU WIN' : "YOU LOSE, THE KEY WAS #{game.key}" )
end

play_mastermind