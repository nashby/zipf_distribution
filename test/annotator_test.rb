require 'test_helper'
require 'psych'

describe Zipf::Annotator do

  describe ".annotate" do
    let(:size_50) { Zipf::Annotator.new(annotated_text, 50) }
    let(:size_30) { Zipf::Annotator.new(annotated_text, 30) }
    let(:size_5) { Zipf::Annotator.new(annotated_text, 5) }

    let(:words) { {"habits"=>8, "habit"=>7, "maze"=>6, "one"=>6, "rats"=>5, "every"=>5, "can"=>4, "rat"=>4, "research"=>4, "inside"=>4, "like"=>4, "brain"=>3, "became"=>3, "animal"=>3, "major"=>3, "activity"=>3, "patterns"=>3, "target"=>3, "making"=>3, "think"=>2, "began"=>2, "told"=>2, "brains"=>2, "shopping"=>2, "chocolate"=>2, "understanding"=>2, "department"=>2, "tiny"=>2, "analytics"=>2, "turns"=>2, "others"=>2, "automatically"=>2, "different"=>2, "called"=>2, "predictive"=>2, "habitually"=>2, "named"=>2, "day"=>2, "behavioral"=>2, "barrier"=>2, "time"=>2, "conscious"=>2, "snif"=>2, "figure"=>2, "people"=>2, "also"=>2, "corners"=>2, "even"=>2, "data"=>2, "scientist"=>2, "working"=>2, "chief"=>2, "automatic"=>2, "less"=>2, "well"=>2, "feb"=>2, "hundreds"=>2, "article"=>2, "field"=>2, "become"=>2, "will"=>2, "scratched"=>1, "place"=>1, "times"=>1, "facebook"=>1, "page"=>1, "adapted"=>1, "power"=>1, "life"=>1, "business"=>1, "published"=>1, "reason"=>1, "snoop"=>1, "past"=>1, "two"=>1, "decades"=>1, "science"=>1, "formation"=>1, "discussion"=>1, "formed"=>1, "neurology"=>1, "psychology"=>1, "departments"=>1, "discuss"=>1, "medical"=>1, "centers"=>1, "universities"=>1, "tuesday"=>1, "duhigg"=>1, "extremely"=>1, "financed"=>1, "corporate"=>1, "labs"=>1, "charles"=>1, "arms"=>1, "race"=>1, "hire"=>1, "statisticians"=>1, "nowadays"=>1, "said"=>1, "andreas"=>1, "weigend"=>1, "former"=>1, "join"=>1, "cookie"=>1, "amazon"=>1, "com"=>1, "mathematicians"=>1, "suddenly"=>1, "sexy"=>1, "ability"=>1, "analyze"=>1, "break"=>1, "grown"=>1, "fine"=>1, "grained"=>1, "push"=>1, "understand"=>1, "daily"=>1, "influence"=>1, "decisions"=>1, "exciting"=>1, "topics"=>1, "clinical"=>1, "multimedia"=>1, "though"=>1, "hardly"=>1, "aware"=>1, "now"=>1, "exist"=>1, "study"=>1, "duke"=>1, "university"=>1, "estimated"=>1, "rather"=>1, "much"=>1, "decision"=>1, "amazing"=>1, "shape"=>1, "percent"=>1, "choices"=>1, "make"=>1, "age"=>1, "recent"=>1, "discoveries"=>1, "begun"=>1, "change"=>1, "everything"=>1, "way"=>1, "dieting"=>1, "doctors"=>1, "conceive"=>1, "treatments"=>1, "anxiety"=>1, "depression"=>1, "addictions"=>1, "transforming"=>1, "function"=>1, "across"=>1, "organizations"=>1, "societies"=>1, "football"=>1, "coach"=>1, "golden"=>1, "tony"=>1, "dungy"=>1, "propelled"=>1, "worst"=>1, "teams"=>1, "super"=>1, "bowl"=>1, "focusing"=>1, "players"=>1, "living"=>1, "reacted"=>1, "cues"=>1, "world"=>1, "treasury"=>1, "secretary"=>1, "paul"=>1, "neill"=>1, "overhauled"=>1, "stumbling"=>1, "conglomerate"=>1, "alcoa"=>1, "turned"=>1, "top"=>1, "performer"=>1, "dow"=>1, "jones"=>1, "relentlessly"=>1, "attacking"=>1, "specific"=>1, "approach"=>1, "worker"=>1, "safety"=>1, "turn"=>1, "caused"=>1, "companywide"=>1, "transformation"=>1, "obama"=>1, "campaign"=>1, "hired"=>1, "specialist"=>1, "trigger"=>1, "new"=>1, "voting"=>1, "among"=>1, "conference"=>1, "constituencies"=>1, "researchers"=>1, "figured"=>1, "stop"=>1, "overeating"=>1, "biting"=>1, "nails"=>1, "explain"=>1, "chairman"=>1, "jog"=>1, "morning"=>1, "productive"=>1, "work"=>1, "consultant"=>1, "oversleep"=>1, "procrastinate"=>1, "calculus"=>1, "siegel"=>1, "mastering"=>1, "subconscious"=>1, "urges"=>1, "companies"=>1, "exhaustive"=>1, "rendering"=>1, "unconscious"=>1, "sets"=>1, "algorithms"=>1, "revolutionized"=>1, "know"=>1, "therefore"=>1, "precisely"=>1, "sell"=>1, "eric"=>1, "cognitive"=>1, "sciences"=>1, "massachusetts"=>1, "institute"=>1, "technology"=>1, "casual"=>1, "observer"=>1, "look"=>1, "dollhouse"=>1, "versions"=>1, "surgical"=>1, "theaters"=>1, "rooms"=>1, "says"=>1, "scalpels"=>1, "small"=>1, "drills"=>1, "miniature"=>1, "saws"=>1, "operating"=>1, "tables"=>1, "petite"=>1, "prepared"=>1, "year"=>1, "old"=>1, "surgeons"=>1, "shrunken"=>1, "neurologists"=>1, "cut"=>1, "skulls"=>1, "anesthetized"=>1, "smartest"=>1, "implanting"=>1, "sensors"=>1, "record"=>1, "smallest"=>1, "changes"=>1, "always"=>1, "market"=>1, "neuroscientist"=>1, "ann"=>1, "graybiel"=>1, "efficiently"=>1, "colleagues"=>1, "personal"=>1, "exploring"=>1, "decade"=>1, "ago"=>1, "putting"=>1, "wired"=>1, "shaped"=>1, "consumers"=>1, "just"=>1, "end"=>1, "structured"=>1, "devoted"=>1, "positioned"=>1, "behind"=>1, "service"=>1, "opened"=>1, "loud"=>1, "click"=>1, "first"=>1, "postal"=>1, "banks"=>1, "placed"=>1, "usually"=>1, "wander"=>1, "slowly"=>1, "center"=>1, "aisle"=>1, "slid"=>1, "away"=>1, "investment"=>1, "chains"=>1, "scratching"=>1, "walls"=>1, "appeared"=>1, "smell"=>1, "couldn"=>1, "gure"=>1, "discernible"=>1, "pattern"=>1, "meanderings"=>1, "indication"=>1, "grocery"=>1, "hard"=>1, "find"=>1, "treat"=>1, "probes"=>1, "heads"=>1, "however"=>1, "story"=>1, "wandered"=>1, "furiously"=>1, "sniffed"=>1, "air"=>1, "take"=>1, "wall"=>1, "neurosensors"=>1, "head"=>1, "exploded"=>1, "scientists"=>1, "repeated"=>1, "experiment"=>1, "eventually"=>1, "stopped"=>1, "wrong"=>1, "zip"=>1, "speed"=>1, "within"=>1, "something"=>1, "unexpected"=>1, "occurred"=>1, "learned"=>1, "complete"=>1, "quickly"=>1, "mental"=>1, "decreased"=>1, "path"=>1, "retailer"=>1, "started"=>1, "thinking"=>1, "almost"=>1, "process"=>1, "converts"=>1, "sequence"=>1, "actions"=>1, "routine"=>1, "chunking"=>1, "dozens"=>1, "chunks"=>1, "rely"=>1, "simple"=>1, "put"=>1, "toothpaste"=>1, "toothbrush"=>1, "sticking"=>1, "mouth"=>1, "kids"=>1, "lunch"=>1, "little"=>1, "complex"=>1, "still"=>1, "complicated"=>1, "remarkable"=>1, "realize"=>1, "emerged"=>1} }

    let(:annotated_text) do
      File.join(File.dirname(__FILE__), 'fixtures/annotator_texts/annotated_text.txt')
    end

    let(:annotations_50) do
      File.join(File.dirname(__FILE__), 'fixtures/annotator_texts/annotations_50.txt')
    end

    let(:annotations_30) do
      File.join(File.dirname(__FILE__), 'fixtures/annotator_texts/annotations_30.txt')
    end

    let(:annotations_5) do
      File.join(File.dirname(__FILE__), 'fixtures/annotator_texts/annotations_5.txt')
    end

    it 'annotates text, size 50' do
      size_50.annotate.must_equal YAML.load(File.open(annotations_50))
      size_30.words.must_equal words
    end

    it 'annotates text, size 30' do
      size_30.annotate.must_equal YAML.load(File.open(annotations_30))
      size_30.words.must_equal words
    end

    it 'annotates text, size 5' do
      size_5.annotate.must_equal YAML.load(File.open(annotations_5))
      size_30.words.must_equal words
    end
  end
end
