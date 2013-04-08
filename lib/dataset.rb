class Dataset
  attr_accessor :json_obj, :map_obj

  BASE_URL = "http://localhost:9393/api/base/"
  MAP_URL = "http://localhost:9393/api/map/"
  DATASET_IDS = ["66zw-pb7t"]

  def self.load_random
    Dataset.new(DATASET_IDS.sample)
  end

  def initialize(id)
    @id = id

    json_txt = Dataset.load_url(base_url)
    @json_obj = MultiJson.decode(json_txt)

    json_txt = Dataset.load_url(map_url)
    @map_obj = MultiJson.decode(json_txt)
  end

  def base_url
    BASE_URL + @id
  end

  def map_url
    MAP_URL + @id
  end

  def overview(app_name)
    ["#{app_name} is a way to visualize data related to #{@json_obj["category"].downcase}.",
    "Using the #{@json_obj["description"].downcase}, we overlayed #{@json_obj["name"]} onto a map.",
    "Submitted to NYC BigApps 3.0 2013"]
  end

  private

  def self.load_url(url)
    puts url
    res = Typhoeus.get(url)
    puts res.body
    res.body
  end

end
