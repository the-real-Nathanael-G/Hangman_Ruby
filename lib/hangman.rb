require_relative "life"
class Hangman
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
    topics
    @answer = @the_topic
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
      "You Lose!" + "The word was: " + @answer + Life.new(@life).life_stages
    elsif !blanks.include?('_')
      "You Win!!! The word was: " + blanks
    else
      "The word has #{@the_secret_word.count guess} " + guess.to_s + "'s. " + blanks
    end
  end

  def topics
    if @topic_choice == "1"
      @the_topic = words_in_topics[:sport]
      "You have chosen Sport"
    elsif @topic_choice == "2"
      @the_topic = words_in_topics[:food_and_drink]
      "You have chosen Food & Drink"
    elsif @topic_choice == "3"
      @the_topic = words_in_topics[:hobbies]
      "You have chosen Hobbies"
    elsif @topic_choice == "4"
      @the_topic = words_in_topics[:animals]
      "You have chosen Animals"
    elsif @topic_choice == "5"
      @the_topic = words_in_topics[:wild_cards]
      "You have chosen Wild cards"
    end
    @the_topic
  end

  def words_in_topics
  {:sport => ["Basketball", "Football", "Ice hockey", "Baseball", "Tennis", "Hockey", "Archery", "Rock climbing", "Golf", "Athletics"].sample,
    :food_and_drink =>  ["Ice cream", "Victoria sponge cake", "Chocolate", "Apple", "Orange", "Strawberry", "Kebab", "Burger", "Smoothie", "Milkshake", "Jelly", "Sausage", "Tomato", "Pepper", "Olives", "Cheese", "Jalapeno", "Cucumber", "Slushie"].sample,
    :hobbies => ["Dance", "Gardening", "Music", "Stamp collecting", "Collectibles", "Drawing", "Sewing", "Photography", "Television"].sample,
    :animals => ["Tyranosaurus rex", "Beluga whale", "Great white shark", "Triceratops", "Monkey", "Panther", "Gorilla", "Foal", "Parrot", "Cannary", "Parakeet", "Bald eagle", "Calf", "Lamb", "Squid", "Sea urchin", "Lion", "Badger", "Cheetah"].sample,
    :wild_cards => ["Football", "Archery", "Music", "Drawing", "Tyranosaurus rex", "Victoria sponge cake", "Rock climbing", "Sewing", "Gorilla" ,"Kebab", "Milkshake", "Great white shark", " Pepper", "Lion", "Television", "Beluga whale", "Olive", "Cheetah", "Cheese"].sample}
  end

  def game_loop
    puts "Welcome"
    puts "Choose your category:"
    puts "1.Sport, \n2.Food & drink, \n3.Hobbies, \n4.Animals, \n5.Wild cards."
    set_secret_word(gets.chomp)
    until @life == 0 || !blanks.include?('_')
      puts word_guess(gets.chomp)
    end
  end
end

Hangman.new.game_loop
