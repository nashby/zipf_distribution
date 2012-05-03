require 'test_helper'

describe Zipf::Classifier do

  describe ".classily" do
    subject do
      classifier = Zipf::Classifier.new(:programming, :medicine)

      classifier.add_to :programming, programming_text_1
      classifier.add_to :programming, programming_text_2
      classifier.add_to :medicine, medicine_text_1
      classifier.add_to :medicine, medicine_text_2

      classifier
    end

    let(:programming_text_1) do
      File.join(File.dirname(__FILE__), 'fixtures/classifier_texts/programming_1.txt')
    end

    let(:programming_text_2) do
      File.join(File.dirname(__FILE__), 'fixtures/classifier_texts/programming_2.txt')
    end

    let(:programming_test) do
      File.join(File.dirname(__FILE__), 'fixtures/classifier_texts/test_programming.txt')
    end

    let(:medicine_text_1) do
      File.join(File.dirname(__FILE__), 'fixtures/classifier_texts/cancer_1.txt')
    end

    let(:medicine_text_2) do
      File.join(File.dirname(__FILE__), 'fixtures/classifier_texts/cancer_2.txt')
    end

    let(:medicine_test) do
      File.join(File.dirname(__FILE__), 'fixtures/classifier_texts/test_medicine.txt')
    end

    it 'classifies programming text' do
      subject.classify(programming_test).must_equal :programming
    end

    it 'classifies medecine text' do
      subject.classify(medicine_test).must_equal :medicine
    end
  end
end
