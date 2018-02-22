require 'sinatra'
require 'movie'
require 'parser_controller'
require 'open-uri'
require 'json'

get('/') do
  @movie = Movie.new
  @movie.title = 'Jaws'
  get_parser
  erb :index
end

get('/update') do
  update_parser
  redirect('/')
end