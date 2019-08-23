class V1::AnimalsController < V1::ApplicationController

  def index
    if params[:long_term] == 'true'
    @animals = Animal.long_term
  else
    @animals = Animal.all
  end
    json_response(@animals)
  end

  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def random
    if params[:long_term] == 'true'
      @animal = Animal.long_term.random
    else
      @animal = Animal.random
    end
    json_response(@animal)
  end

  def search
    if params[:long_term] == 'true'
      @search_results = Animal.long_term.search(params[:term])
    else
      @search_results = Animal.search(params[:term])
    end
    json_response(
      {
        "message": "Animal with id=#{@animal.id} created successfully.",
        "animal": @animal
      },
      :created
    )
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      json_response(
        {
          "message": "Animal with id=#{@animal.id} updated successfully.",
          "animal": @animal
        }
      )
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
