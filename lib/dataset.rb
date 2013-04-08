class Dataset
  BASE_URL = "https://raw.github.com/tlevine/nyc-data-downloads/master/views/"
  DATASET_IDS = ["2bh6-qmgg", "2iia-33q9", "2j99-6h29", "2und-rhm4"]

  def self.load_random
    url = BASE_URL + DATASET_IDS.sample + ".json"
    json_txt = load_url(url)

    Dataset.new(json_txt)
  end

  def initialize(json_txt)
    @json_obj = MultiJson.decode(json_txt)
  end


  def spew_bullshit(app_name)
    <<-BS
      <p>#{app_name} is a way to visualize data related to #{@json_obj["category"].downcase}.</p>
      <p>Using data from the #{@json_obj["attribution"]}, we overlayed #{@json_obj["name"]} onto a map.</p>
    BS
  end

  private

  def self.load_url(url)
    res = Typhoeus.get(url)
    res.body
  end

end