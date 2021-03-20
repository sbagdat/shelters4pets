class PetsController < ApplicationController
  before_action :select_pet, only: [:show, :edit, :update]

  def index
    @pets = Pet.all
  end

  def show; end

  def edit; end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet), notice: "Pet has successfully updated."
  end

  def shelter_pets
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets
    render "shelters/show"
  end

  private

  def select_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :age)
  end
end
