require 'test_helper'

describe Zipf::Classifier do

  describe ".classify" do
    subject do
      classifier = Zipf::Classifier.new(:programming, :medicine, :history)

      classifier.add_to :programming, programming_text_1
      classifier.add_to :programming, programming_text_2
      classifier.add_to :medicine, medicine_text_1
      classifier.add_to :medicine, medicine_text_2
      classifier.add_to :history, history_text_1
      classifier.add_to :history, history_text_2

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

    let(:history_text_1) do
      File.join(File.dirname(__FILE__), 'fixtures/classifier_texts/history_1.txt')
    end

    let(:history_text_2) do
      File.join(File.dirname(__FILE__), 'fixtures/classifier_texts/history_2.txt')
    end

    let(:history_test) do
      File.join(File.dirname(__FILE__), 'fixtures/classifier_texts/test_history.txt')
    end

    it 'classifies programming text' do
      subject.classify(programming_test).must_equal :programming
      subject.ranks_to_classify.must_equal({"programming"=>1, "development"=>1, "wide"=>2, "perl"=>2, "language"=>2, "originally"=>2, "developed"=>2, "text"=>2, "manipulation"=>2, "2010"=>2, "used"=>2, "purpose"=>2, "range"=>2, "tasks"=>2, "including"=>2, "system"=>2, "administration"=>2, "web"=>2, "general"=>2, "network"=>2, "games"=>2, "bioinformatics"=>2, "gui"=>2})
    end

    it 'classifies medecine text' do
      subject.classify(medicine_test).must_equal :medicine
      subject.ranks_to_classify.must_equal({"excess"=>1, "enlargement"=>2, "low"=>2, "can"=>2, "high"=>2, "serum"=>2, "facial"=>2, "produce"=>2, "muscle"=>2, "syndrome"=>2, "acne"=>3, "patients"=>3, "glucocorticoid"=>3, "syndromes"=>3, "include"=>3, "weight"=>3, "gain"=>3, "hormonal"=>3, "wasting"=>3, "purple"=>3, "lines"=>3, "abdomen"=>3, "fatty"=>3, "buffalo"=>3, "hump"=>3, "neck"=>3, "moonlike"=>3, "face"=>3, "thinning"=>3, "fragile"=>3, "skin"=>3, "virilism"=>3, "androgen"=>3, "obvious"=>3, "women"=>3, "may"=>3, "symptoms"=>3, "signs"=>3, "body"=>3, "hair"=>3, "cushing"=>3, "evaluated"=>3, "clitoris"=>3, "deepening"=>3, "voice"=>3, "coarsening"=>3, "features"=>3, "cessation"=>3, "menstruation"=>3, "conn"=>3, "mineralcorticoid"=>3, "marked"=>3, "carefully"=>3, "blood"=>3, "pressure"=>3, "carcinoma"=>3, "result"=>3, "headache"=>3, "hypokalemia"=>3, "adrenocortical"=>3, "suspected"=>3, "potassium"=>3, "turn"=>3, "weakness"=>3, "confusion"=>3, "palpitations"=>3, "plasma"=>3, "renin"=>3,"activity"=>3, "aldosterone"=>3, "feminization"=>3, "estrogen"=>3, "readily"=>3, "noted"=>3, "men"=>3, "includes"=>3, "breast"=>3, "decreased"=>3, "libido"=>3, "impotence"=>3})
    end

    it 'classifies history text' do
      subject.classify(history_test).must_equal :history
      subject.ranks_to_classify.must_equal({"japanese"=>1, "russian"=>2, "port"=>3, "general"=>3, "division"=>4, "arthur"=>4, "vitgeft"=>5, "army"=>5, "east"=>5, "5th"=>5, "men"=>5, "000"=>5, "peninsula"=>5, "siberian"=>5, "second"=>5, "rifles"=>5, "admiral"=>5, "forces"=>5, "command"=>5, "stoessel"=>5, "divisions"=>5, "left"=>5, "colonel"=>5, "position"=>5, "dug"=>5, "landing"=>5, "fok"=>6, "osaka"=>6, "nagoya"=>6, "completed"=>6, "may"=>6, "1904"=>6, "intention"=>6, "break"=>6, "third"=>6, "defensive"=>6, "tokyo"=>6, "capture"=>6, "dalny"=>6, "lay"=>6, "siege"=>6, "viceroy"=>6, "yevgeni"=>6, "alekseyev"=>6, "recalled"=>6, "moscow"=>6, "consultations"=>6, "tsar"=>6, "first"=>6, "major"=>6, "baron"=>6, "anatoly"=>6, "three"=>6, "consisted"=>6, "ground"=>6, "strong"=>6, "kwantung"=>6, "500"=>6, "wilgelm"=>6, "miles"=>6, "control"=>6, "fleet"=>6, "since"=>6, "direct"=>6, "orders"=>6, "indecisive"=>6, "incompetent"=>6, "allowed"=>6, "proceed"=>6, "unopposed"=>6, "liaotung"=>6, "landed"=>6, "4th"=>6, "oku"=>6, "13th"=>6, "14th"=>6, "15th"=>6, "yasukata"=>6, "commanded"=>6, "river"=>6, "yalu"=>6, "nikolai"=>6, "tretyakov"=>6, "victory"=>6, "fortified"=>6, "positions"=>6, "nanshan"=>6, "hill"=>6, "planned"=>6, "hold"=>6, "despite"=>6, "knowing"=>6, "greatly"=>6, "outnumbered"=>6, "reserve"=>6, "lieutenant"=>6, "alexander"=>6, "fourth"=>6, "former"=>6, "police"=>6, "officer"=>6, "risen"=>6, "political"=>6, "patronage"=>6, "rather"=>6, "experience"=>6, "ability"=>6, "114"=>6, "pieces"=>6, "field"=>6, "artillery"=>6, "machine"=>6, "guns"=>6, "network"=>6, "trenches"=>6, "barbed"=>6, "wire"=>6, "well"=>6, "aware"=>6, "fortifications"=>6, "doi"=>6, "intelligence"=>6, "one"=>6, "chinese"=>6, "laborers"=>6, "recruited"=>6, "russians"=>6, "work"=>6, "project"=>6, "1903"=>6})
    end
  end
end
