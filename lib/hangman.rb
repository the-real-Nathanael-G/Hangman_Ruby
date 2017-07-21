require_relative "life"
require_relative "dictionary"
require "stringio"
class Hangman
  def initialize(input)
   @input = input
  end

  def losing_situation(guess)
    @life = @life - 1
    if @life == 0
      game_over?(guess)
    else
      "The word has 0 " + guess.to_s + "'s." + Life.new(@life).life_stages
    end
  end

  def blanks
    blanked_out_name = @the_secret_word
    for letter in @letters_in_word do
      blanked_out_name = blanked_out_name.gsub('  ', '/')
      blanked_out_name = blanked_out_name.gsub(letter, '_ ')
    end
    blanked_out_name
  end

  def set_secret_word(secret_word)
    @topic_choice = secret_word
    @the_topic = Dictionary.new.topics(@topic_choice)
    @the_secret_word = @the_topic
    @the_secret_word = @the_secret_word.downcase
    length = @the_secret_word.length
    @life = 10
    @letters_in_word = @the_secret_word.scan /\w/
    puts "The word has " + length.to_s + " letters. " + blanks
  end

  def word_guess(guess)
    if @letters_in_word.include? guess
      updated_name = @letters_in_word.delete guess
      game_over?(guess) if game_over?(guess)
    else
      losing_situation(guess)
    end
  end

  def game_over?(guess)
    if @life == 0
      "You Lose!" + "The word was: " + @the_topic + Life.new(@life).life_stages
    elsif !blanks.include?('_')
      "You Win!!! The word was: " + blanks
    else
      "The word has #{@the_secret_word.count guess} " + guess.to_s + "'s. " + blanks
    end
  end

  def game_loop
    puts "Welcome"
    puts "Choose your category:"
    puts "1.Sport, \n2.Food & drink, \n3.Hobbies, \n4.Animals, \n5.Wild cards."
    selection = @input.gets.chomp
    set_secret_word(selection)
    until @life == 0 || !blanks.include?('_')
      puts word_guess(@input.gets.chomp)
    end
  end
end

Hangman.new($stdin).game_loop
