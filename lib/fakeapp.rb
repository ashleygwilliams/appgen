class FakeApp
  attr_accessor :name, :description

  SUBJECTS = ["bike", "healthy", "learning", "NYC", "green", "democracy"]
  JARGON = ["responsive", "game", "beta", "tech", "digital", "social"]

  def initialize
    @name = FakeApp.getRandomName
    @description = FakeApp.getRandomText(@name)
  end

  def self.getRandomName
    SUBJECTS.sample + " " + JARGON.sample
  end

  def self.getRandomText(app_name)
    Dataset.load_random.spew_bullshit(app_name)
  end

end
