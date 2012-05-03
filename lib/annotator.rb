require_relative 'zipf_distribution'
require_relative 'stop_words'

require "tactful_tokenizer"

module Zipf
  class Annotator
    attr_reader :annotations

    def initialize(path_to_file, size)
      @zipf  = Zipf::Distribution.new(path_to_file)
      @size  = size
      @words = @zipf.freq
    end

    def annotate
      @annotations = []

      @words.each do |word, _|
        sentences.each do |sentence|
          break if (@annotations.join(' ').size / @zipf.text.size) * 100 >= @size
          @annotations << sentence if sentence.include?(word)
        end
      end

      @annotations
    end

    private

    def sentences
      @sentences ||= TactfulTokenizer::Model.new.tokenize_text(@zipf.text)
    end
  end
end
