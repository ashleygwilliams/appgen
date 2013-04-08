class MapPresenter
  def initialize(dataset)
    @dataset = dataset
  end
  
  def leaflet_geojson
    MultiJson.encode(@dataset.map_obj) 
  end
end
 
 
class AboutPresenter
  def initialize(dataset)
    @dataset = dataset
  end
  
  def getDataDescription
    @dataset.json_obj["description"]
  end

  def getDataName
    @dataset.json_obj["name"]
  end

  def getDataCategory
    @dataset.json_obj["category"]
  end

end