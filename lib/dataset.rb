class Dataset
  attr_accessor :json_obj, :map_obj

  DATASET_IDS = ["66zw-pb7t"]

  def self.load_random
    Dataset.new(DATASET_IDS.sample)
  end

  def initialize(id)
    @id = id

    json_txt = Dataset.load_file('base', @id)
    @json_robj = MultiJson.decode(json_txt)
    @json_obj = json_txt;

    json_txt = Dataset.load_file('map', @id)
    @map_robj = MultiJson.decode(json_txt)
    @map_obj = json_txt;
  end

  def base_url
    BASE_URL + @id
  end

  def map_url
    MAP_URL + @id
  end

  def overview(app_name)
    ["#{app_name} is a way to visualize data related to #{@json_robj["category"].downcase}.",
    "Using the #{@json_robj["description"].downcase}, we overlayed #{@json_robj["name"]} onto a map.",
    "Submitted to NYC BigApps 3.0 2013"]
  end

  private

  def self.load_file(type, id)
    filename = File.join('data', type, "#{id}.json")
    File.open(filename, 'r').read
  end

end
