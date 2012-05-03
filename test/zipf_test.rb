require 'test_helper'

describe Zipf::Distribution do

  describe "simple text" do
    subject { Zipf::Distribution.new(File.join(File.dirname(__FILE__), 'fixtures/test.txt')) }

    it 'returns text' do
      subject.text.must_equal "one one one one one two two two two three three four four five"
    end

    it 'returns words' do
      subject.words.must_equal %w[one one one one one two two two two three three four four five]
    end

    it 'returns frequency' do
      subject.freq.must_equal({'one' => 5, 'two' => 4, 'three' => 2, 'four' => 2, 'five' => 1})
    end

    it 'returns ranks' do
      subject.ranks.must_equal({'one' => 1, 'two' => 2, 'three' => 3, 'four' => 3, 'five' => 4})
    end

    it 'returns probability' do
      assert_in_delta 0.35, subject.probability('one'), 0.01
    end

    it 'returns zconst' do
      assert_in_delta 0.35, subject.zconst('one'), 0.01
    end
  end

  describe "big text" do
    subject { Zipf::Distribution.new(File.join(File.dirname(__FILE__), 'fixtures/big_text.txt')) }

    # for the english texts Zipf's const ~ 0.1
    it 'returns zconst' do
      assert_in_delta 0.01, subject.zconst('find'), 0.08
      assert_in_delta 0.01, subject.zconst('data'), 0.08
    end
  end
end
