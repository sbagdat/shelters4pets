class PetsController < ApplicationController
  before_action :select_pet, only: [:show]

  def index
    @pets = Pet.all
  end

  def show; end

  def shelter_pets
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets
    render "shelters/show"
  end

  private

  def select_pet
    @pet = Pet.find(params[:id])
  end
end
