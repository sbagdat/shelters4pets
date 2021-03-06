# frozen_string_literal: true

class PetsController < ApplicationController
  before_action :select_pet, except: %i[index new create]
  before_action :select_shelter, if: -> { params[:shelter_id].present? }
  before_action :select_shelter_pets, if: -> { @shelter }

  def index
    if params[:shelter_id].present?
      apply_filters
      render "shelters/show"
    elsif params[:name].present?
      filter_by_name
    else
      @pets = Pet.columns_for_index
    end
  end

  def show; end

  def new
    @pet = @pets.new
  end

  def create
    @pets.create(pet_params)
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

  def apply_filters
    apply_sort_filter
    apply_age_filter
  end

  def select_shelter
    @shelter = Shelter.includes(:pets).find(params[:shelter_id])
  end

  def select_pet
    @pet = Pet.columns_for_index.find(params[:id])
  end

  def select_shelter_pets
    @pets = @shelter.pets
  end

  def apply_sort_filter
    @pets = @pets.order(:name) if params[:sorted]
  end

  def apply_age_filter
    age_filter = params[:age_filter]
    @pets = @pets.age_older_than(age_filter.to_i) if age_filter
  end

  def filter_by_name
    @pets = Pet.filter_by_name(params[:name].strip, params[:exact])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :age, :shelter_id)
  end
end
