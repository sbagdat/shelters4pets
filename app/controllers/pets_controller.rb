class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def shelter_pets
    # binding.pry
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets
    render "shelters/show"
  end
end
