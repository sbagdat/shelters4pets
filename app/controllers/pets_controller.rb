class PetsController < ApplicationController
  before_action :select_pet, except: %i[index new create]
  before_action :select_shelter, only: %i[new create]

  def index
    if params[:shelter_id]
      select_shelter
      @pets = @shelter.pets
      @pets = @pets.age_older_than(params[:age_filter].to_i) if params[:age_filter]
      render "shelters/show"
    end
    @pets = Pet.adoptable
  end

  def show; end

  def new
    @pet = @shelter.pets.new
  end

  def create
    @shelter.pets.create(pet_params)
    redirect_to shelter_pets_url, notice: "New pet is created."
  end

  def edit; end

  def update
    @pet.update!(pet_params)
    redirect_to pet_url(@pet), notice: "Pet has successfully updated."
  end

  def destroy
    @pet.destroy
    redirect_to pets_url, notice: "Pet has successfully deleted."
  end

  private

  def select_shelter
    @shelter = Shelter.find(params[:shelter_id])
  end

  def select_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :age)
  end
end
