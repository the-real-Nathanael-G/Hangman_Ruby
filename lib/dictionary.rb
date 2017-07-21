class Dictionary

  def topics()
    case @topic_choice
    when "1"
      the_topic = words_in_topics[:sport]
      puts "You have chosen Sport"
    when "2"
      the_topic = words_in_topics[:food_and_drink]
      puts "You have chosen Food & Drink"
    when "3"
      the_topic = words_in_topics[:hobbies]
      puts "You have chosen Hobbies"
    when "4"
      the_topic = words_in_topics[:animals]
      puts "You have chosen Animals"
    when "5"
      the_topic = words_in_topics[:wild_cards]
      puts "You have chosen Wild cards"
    end
    the_topic = @the_topic
    return @the_topic
  end

  def words_in_topics
  {:sport => ["Basketball", "Football", "Ice hockey", "Baseball", "Tennis", "Hockey", "Archery", "Rock climbing", "Golf", "Athletics"].sample,
    :food_and_drink =>  ["Ice cream", "Victoria sponge cake", "Chocolate", "Apples", "Oranges", "Strawberries", "Kebabs", "Burgers", "Smoothies", "Milkshakes", "Jelly", "Sausages", "Tomatoes", "Peppers"].sample,
    :hobbies => ["Dance", "Gardening", "Music", "Stamp collecting", "Collectibles", "Drawing", "Sewing", "Photography", "Television"].sample,
    :animals => ["Tyranosaurus rex", "Beluga whale", "Great white shark", "Triceratops", "Monkey", "Panther", "Gorilla", "Foal", "Parrot", "Cannary", "Parakeet", "Bald eagle", "Calf", "Lamb", "Squids", "Sea urchin", "Lion"].sample,
    :wild_cards => ["Football", "Archery", "Music", "Drawing", "Tyranosaurus rex", "Victoria sponge cake", "Rock climbing", "Sewing", "Gorilla" ,"Kebabs", "Milkshakes", "Great white shark", " Peppers", "Lion", "Television", "Beluga whale"].sample}
  end
end
