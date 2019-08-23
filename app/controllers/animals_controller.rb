class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
    json_response(@animals)
  end

  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def create
    @animal = Animal.create!(animal_params)
    json_response(@animal, :created)
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      json_response(@animal)
    else
      json_response(@animal.errors, :unprocessable_entity)
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    json_response(
      {"message": "Animal with id=#{@animal.id} deleted successfully."}
    )
  end

  private
  def animal_params
    params.permit(:name, :species, :sex, :birthday, :description, :arrival_date)
  end
end
