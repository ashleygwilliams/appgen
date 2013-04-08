class Dataset
  attr_accessor :json_obj, :map_obj

  DATASET_IDS = ["66zw-pb7t","44yz-sz5t","66zw-pb7t","66w5-fdhb","6bzx-emuu"]

  def self.load_random
    Dataset.new(DATASET_IDS.sample)
  end

  def initialize(id)
    @id = id

    json_txt = Dataset.load_file('base', @id)
    @json_obj = MultiJson.decode(json_txt)

    json_txt = Dataset.load_file('map', @id)
    @map_obj = MultiJson.decode(json_txt)
  end

  def base_url
    BASE_URL + @id
  end

  def map_url
    MAP_URL + @id
  end

  private

  def self.load_file(type, id)
    filename = File.join('data', type, "#{id}.json")
    File.open(filename, 'r').read
  end

end
