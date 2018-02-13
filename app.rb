require 'sinatra'
require 'movie'
require 'parser_controller'
require 'open-uri'
require 'nokogiri'
require 'json'

get('/') do
  @movie = Movie.new
  @movie.title = 'Jaws'
  parser
  erb :index
end