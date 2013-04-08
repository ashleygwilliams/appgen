class FakeApp

  SUBJECTS = ["bike", "healthy", "learning", "NYC", "green", "democracy"]
  JARGON = ["responsive", "game", "beta", "tech", "digital", "social"]


  def self.getRandomName
    SUBJECTS.sample + " " + JARGON.sample
  end

end