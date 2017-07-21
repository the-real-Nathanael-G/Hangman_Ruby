class Dictionary

  def topics(topic_choice)
    puts topic_choice
    if topic_choice == "1"
      @the_topic = words_in_topics[:sport]
      puts "You have chosen Sport"
    elsif topic_choice == "2"
      @the_topic = words_in_topics[:food_and_drink]
      puts "You have chosen Food & Drink"
    elsif topic_choice == "3"
      @the_topic = words_in_topics[:hobbies]
      puts "You have chosen Hobbies"
    elsif topic_choice == "4"
      @the_topic = words_in_topics[:animals]
      puts "You have chosen Animals"
    elsif topic_choice == "5"
      @the_topic = words_in_topics[:wild_cards]
      puts "You have chosen Wild cards"
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
end
