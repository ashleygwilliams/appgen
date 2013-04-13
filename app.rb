require 'rubygems'
require 'bundler'
require 'erb'

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

class BigApp < Sinatra::Application

  configure do
    set :root, File.dirname(__FILE__)

    Compass.configuration do |config|
      config.project_path = File.dirname(__FILE__)
      config.sass_dir = 'views'
    end

    set :haml, { :format => :html5 }
    set :sass, Compass.sass_engine_options
    set :scss, Compass.sass_engine_options
    set :public_folder, 'public'
  end

  before do
    @seed = if params[:seed]
      params[:seed].to_i
    else
      rand(10000)
    end
    srand(@seed)
    @app = FakeApp.new
  end

  after do
    response['Server'] = @app.server
  end

  get '/' do
    haml File.read("views/boilerplates/#{@app.boilerplate}/index.haml")
  end

  get '/map' do
    haml File.read("views/boilerplates/#{@app.boilerplate}/map.haml")
  end

  get '/info' do
    haml File.read("views/boilerplates/#{@app.boilerplate}/info.haml")
  end

  get "/stylesheet.css" do
    response['Content-Type'] = 'text/css'
    erb :stylesheet
  end

  def partial(haml_file)
    haml haml_file, :layout => false
  end
end
