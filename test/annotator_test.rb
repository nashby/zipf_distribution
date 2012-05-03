require 'test_helper'
require 'yaml'

describe Zipf::Annotator do

  describe ".annotate" do
    subject { Zipf::Annotator.new(annotated_text, 30) }

    let(:annotated_text) do
      File.join(File.dirname(__FILE__), 'fixtures/annotator_texts/annotated_text.txt')
    end

    let(:annotations) do
      File.join(File.dirname(__FILE__), 'fixtures/annotator_texts/annotations.txt')
    end

    it 'annotates text' do
      subject.annotate.must_equal YAML.load(File.open(annotations))
    end
  end
end
