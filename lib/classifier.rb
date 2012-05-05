require_relative 'zipf_distribution'

module Zipf
  class Classifier
    attr_reader :categories
    attr_reader :ranks_to_classify
    
    RANKS = 10

    def initialize(*categories)
      @categories = {}

      categories.each do |category|
        @categories[category] = []
      end
    end

    def classify(path_to_file)
      zipf  = Zipf::Distribution.new(path_to_file)
      @ranks_to_classify = zipf.ranks

      categories_to_choose = {}

      @categories.each do |name, category|
        classified = {}

        category.each do |ranks|
          classified.merge!(Hash[ranks.to_a.take(RANKS)])
        end

        categories_to_choose[name] = similar_keys_count(@ranks_to_classify, classified)
      end

      most_similar(categories_to_choose)
    end

    def add_to(category, path_to_file)
      zipf = Zipf::Distribution.new(path_to_file)

      @categories[category] << zipf.ranks
    end

    private

    def similar_keys_count(to_classify, classified)
      count = 0

      classified.each do |key, _|
        count += 1 if to_classify.has_key?(key)
      end

      count
    end

    def most_similar(categories_to_choose)
      categories_to_choose.sort_by { |_, v| -v }.first.first
    end
  end
end
