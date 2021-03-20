# frozen_string_literal: true

class SheltersController < ApplicationController
  before_action :select_shelter, only: [:show]

  def index
    @shelters = Shelter.all
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

  private

  def select_shelter
    @shelter = Shelter.find(params[:id])
  end

  def shelter_params
    params.require(:shelter).permit(:name, :rank, :city)
  end
end
