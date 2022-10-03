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
  guess = '1122'
  ans_set = ('1111'..'6666').to_a.select {|elem| valid_key?(elem)}
  while !game.over? && game.turn < 12
    game.try(guess)
    ans_set.select! {|elem| compare_keys(guess, elem) == game.last_feedback}
    guess = ans_set[0]
  end
  puts game.log
  puts game.log.end_with?("xxxx\n") ? "COMPUTER WINS, OBVIOUSLY" : "????????????????????????"
end

def play_codebreaker
  include MMMod

  game = MMGame.new(generate_key)
  while !game.over? && game.turn < 12
    key = ask_key
    game.try(key)
    puts game.log
  end
  puts ( game.log.end_with?("xxxx\n") ? 'YOU WIN' : "YOU LOSE, THE KEY WAS #{game.key}" )
end

play_mastermind