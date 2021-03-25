# frozen_string_literal: true

class SheltersController < ApplicationController
  before_action :select_shelter, except: %i[index new create]

  def index
    @shelters = if params[:sort].present?
                  sort_by_pets_count
                elsif params[:name].present?
                  filter_by_name
                else
                  Shelter.all_descending
                end
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

  def filter_by_name
    Shelter.filter_by_name(params[:name].strip, params[:exact])
  end

  def sort_by_pets_count
    Shelter.sort_by_pets_count(params[:sort].strip)
  end

  def select_shelter
    @shelter = Shelter.find(params[:id])
  end

  def shelter_params
    params.require(:shelter).permit(:name, :rank, :city)
  end
end
