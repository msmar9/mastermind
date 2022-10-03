# The data representation for a key is a 4-digit string, digits vary from 1 to 6
module MMMod
  def generate_key
    (Array.new(4) {rand(6) + 1}).join("")
  end

  def valid_key?(key)
    boolean = key.split("").reduce(true) do |boolean, digit|
      boolean = boolean && digit.to_i.between?(1, 6)
      boolean
    end
    boolean && (key.length == 4)
  end

  def ask_key
    # Returns a valid 4-digit string between 1111 and 6666
    puts "Introduce a key:\n(4 digit number, each between 1 and 6)"
    key = gets.chomp
    def ask_again
      puts "Introduce a VALID key:\n(4 digit number, each between 1 and 6)"
      key = gets.chomp
      key = valid_key?(key) ? key : ask_again
    end
    key = valid_key?(key) ? key : ask_again
  end

  def compare_keys(original, guess)
    # Returns a string with and x for every same-place match, and an o for each non-same-place match
    output = ""
    aux1 = []
    aux2 = []
    original = original.split("")
    guess = guess.split("")
    # First we take out all the same-place matching
    original.each_with_index do |digit, index|
      if digit == guess[index]
        output += 'x'
      else
        aux1.push(digit)
        aux2.push(guess[index])
      end
    end
    # Then we count the different-place matches, careful to match each character only once
    aux2.each do |digit|
      if index = aux1.index(digit)
        aux1.delete_at(index)
        output += 'o'
      end
    end

    output
  end

  def ask_role
    puts "Choose a role: Codemaker (1) or Codebreaker (2)"
    role = gets.chomp
    def ask_again
      puts "Type either 1 (Codemaker) or 2 (Codebreaker)"
      role = gets.chomp
      role = ["1", "2"].include?(role) ? role : ask_again
    end
    role = ["1", "2"].include?(role) ? role : ask_again
  end
end
#-----------------------
# Testing
#include MMMod
#p generate_key
#p valid_key?('5586') == false
#p valid_key?('4201') == false
#p valid_key?('5521') == true
#p valid_key?('a521') == false
#p ask_key
#p compare_keys('1552', '2534') == 'xo'
#p compare_keys('5263', '4162') == 'xo'
#p compare_keys('5421', '5421') == 'xxxx'
#p compare_keys('5421', '1245') == 'oooo'
#p compare_keys('5555', '1111') == ''
#p ask_role