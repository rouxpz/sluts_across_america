require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'do_postgres'
require 'json'
require 'fileutils'
require 'eventmachine'

DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/sluts.db")
DataMapper::Property::Text.length(200)

#create class for submissions
class Resource
  
  include DataMapper::Resource
  
  property :id,           Serial
  property :statement,    Text, :lazy => false, :required => true
  property :zipcode,      String, :required => true
  property :latlng,       String
  property :lat,          String
  property :lng,          String

end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  #home page
  @title = "WE ARE ALL SLUTS"
  erb :map
end

get '/testimonials' do
  #testimonial page
  @title = "Slut Solidarity"
  erb :testimonials
  
end

post '/create' do
  
  #save each new entry
  submission = Resource.new
  
  submission.statement = params[:statement]
  submission.zipcode = params[:zipcode]
  submission.latlng = params[:latlng][1..21]
  submission.lat = submission.latlng.split(",").first
  submission.lng = submission.latlng.split(",").last
  
  submission.save
  
  redirect '/'
end

get '/about' do
  #about page
  @title = "About This Project"
  erb :about 
end

get '/contact' do
  #contact page
  @title = "Contact Us"
  erb :contact
end

get '/record' do
  #record window popup
  @title = "Record a Testimonial"
  erb :record
end

get '/browse' do
  output = ''
  for r in Resource.all
    output += <<-HTML
    <!DOCTYPE html>
    <html>
    <head>
      <title>Browse Submissions</title>
      <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </head>
    <body>
    <div class="content"><strong>I'm a slut because...</strong></br>
    #{r.statement}</br>
    <strong>Location: </strong>#{r.zipcode}</br></div>
    </body>
    HTML
  end
  output
end
    

get '/submission/:id' do
  #clearing submissions -- need to authenticate this page
  Resource.get(params[:id]).destroy
  'cleared submission'
end

get '/submissions.json' do
  #json file of data
  content_type 'application/json'
  {'content' => Array(Resource.all)}.to_json
end