class FakeApp
  attr_accessor :name, :description

  SUBJECTS = ["bike", "healthy", "learning", "NYC", "green", "democracy"]
  JARGON = ["responsive", "game", "beta", "tech", "digital", "social"]
  TILE_LAYERS = ["'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {attribution: 'OpenStreetMap'}",
                  "'http://otile{s}.mqcdn.com/tiles/1.0.0/{type}/{z}/{x}/{y}.png', {subdomains: '1234', type: 'osm', attribution: 'MapQuestOpen'}",
                  "'http://otile{s}.mqcdn.com/tiles/1.0.0/{type}/{z}/{x}/{y}.png', {subdomains: '1234', type: 'sat', attribution: 'MapQuestOpen'}",
                  '"http://{s}.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png", {attribution: "OpenCycleMap"}'
  ]

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

  def self.getRandomTiles
    TILE_LAYERS.sample
  end
end
