class ZipfDistribution
  def initialize(path_to_file)
    @path_to_file = path_to_file
  end

  def text
    @text ||= read
  end

  def words
    @words ||= text.downcase.scan(/\w+/)
  end

  def freq
    @freq ||= begin
      freq = Hash.new(0)
      words.each { |word| freq[word] += 1 }.sort_by { |k, v| v }

      freq
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
    total_count / freq[word].to_f
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
