class Api::V1::AnimalsController < ActionController::API

  def show
    begin
      animal = Animal.find(params[:id])
      render status: 200, json: animal.as_json(except: [:created_at, :updated_at])
    rescue  
      render status: 404
    end
  end

  def index
    animals = Animal.all
    render status: 200, json: animals.as_json(except: [:created_at, :updated_at])
  end

  def create
    @animal = Animal.new(params.require(:animal).permit(:name, :sex, :age, :city, :animal_type, :user_pet_care_id))
    if @animal.save
      render status: 201, json: @animal.as_json(except: [:created_at, :updated_at])
    else
      render status: 407
    end
  end

end 