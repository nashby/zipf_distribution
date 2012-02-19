require_relative '../lib/zipf_distribution'

z = ZipfDistribution.new(File.join(File.dirname(__FILE__), 'text.txt'))

p z.freq
p z.ranks

z.plot_count_frequency(File.join(File.dirname(__FILE__), '/output/zl1.png'))
z.plot_frequency_rank(File.join(File.dirname(__FILE__), '/output/zl2.png'))
