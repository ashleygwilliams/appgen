class Dataset
  attr_accessor :json_obj, :map_obj

  BASE_URL = "https://raw.github.com/tlevine/nyc-data-downloads/master/views/"
  MAP_URL = "http://192.168.0.15:1418/"
  DATASET_IDS = ["66zw-pb7t"]

  def self.load_random
    Dataset.new(DATASET_IDS.sample)
  end

  def initialize(id)
    @id = id

    json_txt = load_url(base_url)
    @json_obj = MultiJson.decode(json_txt)

    json_txt = load_url(map_url)
    @map_obj = MultiJson.decode(json_txt)
  end

  def base_url
    BASE_URL + @id + ".json"
  end

  def map_url
    MAP_URL + @id + ".json"
  end

  def overview(app_name)
    ["#{app_name} is a way to visualize data related to #{@json_obj["category"].downcase}.",
    "Using data from the #{@json_obj["attribution"]}, we overlayed #{@json_obj["name"]} onto a map.",
    "Submitted to NYC BigApps 3.0 2013"]
  end

  private

  def self.load_url(url)
    res = Typhoeus.get(url)
    res.body
  end

end
