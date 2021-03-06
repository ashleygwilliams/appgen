class Dataset
  attr_accessor :json_obj, :map_obj

  DATASET_IDS = ["27r8-dii2","3miu-myq2","3pmt-fkk6","3xum-ahi4","44yz-sz5t","483x-fy9e","48pb-zy2g","4nft-bihw","5mw2-hzqx","66zw-pb7t","69w5-fdhb","6bzx-emuu","6dn9-qgma","6j6t-3ixh","733r-da8r","7iqz-npua","7s3q-rztu","8gqz-6v9v","8kiv-2ukd","9d9t-bmk7","9hyh-zkx9","9z9b-6hvk","a5qt-5jpu","ad4c-mphb","ajxm-kzmj","b7kx-qikm","bawj-6bgn","bawk-x4cp","bej7-zmzt","bss9-579f","crbs-vur7","crns-fw6u","cwg5-cqkm","cyfw-hfqk","d4iy-9uh7","d6v5-2daj","dt2z-amuf","en2c-j6tw","evjd-dqpz","f4yq-wry5","fbku-54z3","fjge-cicq","gdgc-4zb5","gzdv-qiga","h3qk-ybvt","hkud-vzzj","ibs4-k445","ikqj-pyhc","irhv-jqz7","iy9q-fs4z","jign-uhe6","jxyc-rxiv","k26i-s5bd","kn7k-w2p6","m3fi-rt3k","m56g-jpua","m59i-mqex","mifw-tguq","mq6n-s45c","n246-cev5","n2s5-fumm","n5mv-nfpy","n5xc-7jfa","nadh-kjkc","ne9f-g6k4","niy5-4j7q","q2ni-ztsb","qbce-2kcu","r247-45ub","r4s5-tb2g","rmv8-86p4","rrzz-u4e8","s3zn-tf7c","sxx4-xhzg","tfbb-gszk","tkdy-59zg","tyfh-9h2y","u35m-9t32","u3bu-v2bf","uuxn-wzxe","vvj6-d5qx","w6yt-hctp","w8dz-xpjh","xbtj-c7ca","xe3f-zpmz"]

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
