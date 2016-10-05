require "sinatra"
require "sinatra/reloader"
require "active_record"

require_relative "db/connection"
require_relative "models/pokemon"

get "/pokemons" do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get "/pokemons/new" do
  erb :"pokemons/new"
end

get "/pokemons/:id/edit" do
  @pokemons = Pokemon.find(params[:id])
  erb :"pokemons/edit"
end

put "/pokemons/:id" do
  @pokemons = Pokemon.find(params[:id])
  @pokemons.update(params[:pokemons])
  redirect "/pokemons/#{@pokemon.id}"
end

post "/pokemons" do
  @pokemons = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

get "/pokemons/:id" do
  @pokemons = Pokemon.find(params[:id])
  erb :"pokemons/show"
end
