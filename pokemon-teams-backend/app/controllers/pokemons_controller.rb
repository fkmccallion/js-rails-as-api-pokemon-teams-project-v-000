class PokemonsController < ApplicationController

  def index
    pokemons = Pokemon.all
    render json: PokemonSerializer.new(pokemons)
  end

  def show
    pokemon = Pokemon.find_by(id: params[:id])
    options = {
      include: [:nickname, :species, :trainer_id]
    }
    render json: PokemonSerializer.new(pokemon, options)
  end

end