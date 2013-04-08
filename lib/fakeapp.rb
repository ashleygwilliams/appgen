class FakeApp

  @@current_app = nil

  attr_accessor :name, :dataset

  PREFIXES = ["responsive", "game", "beta", "tech", "digital", "social", "my", "our", "the", "all", "in", "on"]
  SUFFIXES = ["box", "grid", "share", "wise", "hop", "works", "bit", "book", "list", "square", "rock", ".ly", "sy", "er", ".it", "ie", ".io", ".am", "ia", "ora", "ero", "ist", "ism", "ium", "ble", "ify", "ous", "ing"]
  TILE_LAYERS = ["'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {attribution: 'OpenStreetMap'}",
                  "'http://otile{s}.mqcdn.com/tiles/1.0.0/{type}/{z}/{x}/{y}.png', {subdomains: '1234', type: 'osm', attribution: 'MapQuestOpen'}",
                  "'http://otile{s}.mqcdn.com/tiles/1.0.0/{type}/{z}/{x}/{y}.png', {subdomains: '1234', type: 'sat', attribution: 'MapQuestOpen'}",
                  '"http://{s}.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png", {attribution: "OpenCycleMap"}'
  ]

  def initialize
    @dataset = Dataset.load_random
    @subjects = self.dataset.json_obj["tags"]
    @name = self.getRandomName
    @tile_set = FakeApp.getRandomTiles
    @@current_app = self
  end

  def self.current_app
    @@current_app
  end

  def getRandomName
    if rand > 0.7
      PREFIXES.sample + @subjects.sample
    else
      @subjects.sample + SUFFIXES.sample
    end
  end

  def self.getRandomTiles
    TILE_LAYERS.sample
  end

end
