# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.

#
def guessing_game
  player_guess = ''
  computer_choice = rand(1..100)
  guesses = 0

  until player_guess == computer_choice
    puts "Guess a number between 1 and 100"
    player_guess = gets.chomp.to_i
    guesses += 1

    if player_guess < computer_choice
      puts "You guessed #{player_guess} - too low!"
    elsif player_guess > computer_choice
      puts "You guessed #{player_guess} - too high!"
    elsif player_guess == computer_choice
      puts "You guessed #{player_guess} - correct! You win!"
    end
  end

  puts "#{guesses} guesses"
end

# guessing_game

#############################################
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def file_shuffler
  puts "Please enter a filename to shuffle:"
  file_name = gets.chomp
  lines = File.readlines(file_name)
  shuffled_lines = lines.shuffle

  File.open("#{file_name}-shuffled.txt", "w") do |file|
    shuffled_lines.each { |line| puts line.chomp }
  end
end

# file_shuffler
