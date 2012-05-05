#require_relative 'plotter'

module Zipf
  class Distribution
    #include Zipf::Plotter

    def initialize(path_to_file)
      @path_to_file = path_to_file
    end

    def text
      @text ||= read
    end

    def words
      @words ||= text.downcase.scan(/\w+/).reject { |word| Zipf::STOP_WORDS.include?(word) || word.size <= 2 }
    end

    def freq
      @freq ||= begin
        freq = Hash.new(0)
        words.each { |word| freq[word] += 1 }

        Hash[freq.sort_by { |k, v| -v }]
      end
    end

    def ranks
      @ranks ||= begin
        ranks = {}
        freq.group_by { |k, v| v }.each_with_index do |(prob, word), i|
          word.each { |word, _| ranks[word] = i + 1 }
        end

        ranks
      end
    end

    def probability(word)
      freq[word].to_f / total_count
    end

    def zconst(word)
      probability(word) * ranks[word]
    end

    private

    def read
      File.read(@path_to_file).chomp
    end

    def total_count
      words.count
    end
  end
end
