require "hangman"
describe Hangman do
    let(:io) { StringIO.new }
    let(:hangman_test) { Hangman.new(io) }

    it "returns no. of letters when given word" do
      expect(hangman_test.set_secret_word("1")).to eq ("The word has 7 letters. _ _ _ _ _ _ _ ")
    end

    it "returns no. of letters when given word" do
      expect(hangman_test.set_secret_word("Nathanael")).to eq ("The word has 9 letters. _ _ _ _ _ _ _ _ _ ")
    end

    it "returns number of a's when given a" do
      hangman_test.set_secret_word("Nathanael")
      expect(hangman_test.word_guess("a")).to eq ("The word has 3 a's. _ a_ _ a_ a_ _ ")
    end

    it "returns number of a's and n's when given a and n" do
      hangman_test.set_secret_word("Nathanael")
      hangman_test.word_guess("a")
      expect(hangman_test.word_guess("n")).to eq ("The word has 2 n's. na_ _ ana_ _ ")
    end

    it "returns no o's when given o" do
      hangman_test.set_secret_word("Nathanael")
      hangman_test.word_guess("a")
      hangman_test.word_guess("n")
      expect(hangman_test.word_guess("o")).to eq ("The word has 0 o's.\n |\n |\n |\n_|_____")
    end

    it "returns no z's when given z" do
      hangman_test.set_secret_word
      expect(hangman_test.word_guess("z")).to eq ("The word has 0 z's.\n |\n |\n |\n_|_____")
    end

    it "returns no i's when given i" do
      hangman_test.set_secret_word
      expect(hangman_test.word_guess("i")).to eq ("The word has 0 i's.\n |\n |\n |\n_|_____")
    end

    it "returns number of a's, n's and e's when given a, n and e" do

      hangman_test.set_secret_word
      hangman_test.word_guess("a")
      hangman_test.word_guess("z")
      hangman_test.word_guess("e")
      hangman_test.word_guess("o")
      hangman_test.word_guess("n")
      expect(hangman_test.word_guess("h")).to eq ("The word has 1 h's. na_ hanae_ ")
    end

    it "returns number of a's, n's and e's when given a, n and e" do
      hangman_test.set_secret_word
      hangman_test.word_guess("y")
      hangman_test.word_guess("j")
      hangman_test.word_guess("z")
      hangman_test.word_guess("p")
      hangman_test.word_guess("o")
      hangman_test.word_guess("h")
      hangman_test.word_guess("j")
      hangman_test.word_guess("t")
      hangman_test.word_guess("l")
      hangman_test.word_guess("f")
      hangman_test.word_guess("v")
      hangman_test.word_guess("b")
      expect(hangman_test.word_guess("u")).to eq ("You Lose!\n _________\n |/      |\n |       0\n |      -@-\n |      /|\n_|_____")
    end
end
