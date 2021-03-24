# frozen_string_literal: true

class SheltersController < ApplicationController
  before_action :select_shelter, except: %i[index new create]

  def index
    @shelters = Shelter.all_descending
    sort_by_pets_if_needed
    filter_by_exact_name
  end

  def show; end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    if @shelter.save
      redirect_to shelters_url, notice: "Shelter has been created."
    else
      render :new, notice: "There are some problems..."
    end
  end

  def edit; end

  def update
    if @shelter.update(shelter_params)
      redirect_to shelter_url(@shelter), notice: "Shelter has been updated."
    else
      render :edit, notice: "There are some problems..."
    end
  end

  def destroy
    @shelter.destroy
    redirect_to shelters_url, notice: "Shelter has been deleted."
  end

  private

  def select_shelter
    @shelter = Shelter.find(params[:id])
  end

  def sort_by_pets_if_needed
    sort_type = params[:sort]
    if sort_type
      @shelters = Shelter.sort_by_pets_count(sort_type.to_sym)
    end
  end

  def filter_by_exact_name
    name_param = params[:exact_name]
    if name_param
      @shelters = Shelter.filter_by_name(name_param)
    end
  end

  def shelter_params
    params.require(:shelter).permit(:name, :rank, :city)
  end
end
