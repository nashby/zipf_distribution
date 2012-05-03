require 'gruff'

module Zipf
  module Plotter
    def plot_count_frequency(output)
      labels = {}
      data   = []
      raw_data = freq.sort_by {|k, v| v}.group_by {|k, v| v}

      raw_data.each_with_index do |(k, v), i|
        labels[i] = k.to_s
        data << v.count
      end

      plot(data, labels, "Zipf's law 1", "ZL1", output)
    end

    def plot_frequency_rank(output)
      labels = {}
      data   = []
      raw_data = ranks.group_by {|k, v| v}

      raw_data.each_with_index do |(k, v), i|
        labels[i] = k.to_s
        data << probability(v[0][0]).round(4)
      end

      plot(data, labels, "Zipf's law 2", "ZL2", output)
    end

    private

    def plot(data, labels, title, data_name, output)
      gruff = Gruff::Line.new
      gruff.title = title
      gruff.labels = labels
      gruff.data data_name, data

      gruff.write(output)
    end
  end
end
