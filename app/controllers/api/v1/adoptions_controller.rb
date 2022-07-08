class Api::V1::AdoptionsController < ActionController::API
  def index
    adoptions = Adoption.all
    response = []
    adoptions.each do |adoption|
      response << {title: adoption.title, description: adoption.description,
                   city: adoption.animal.city, animal_type: adoption.animal.animal_type
                  }
    end
    render status: 200, json: response
  end

  def show
    adoption = Adoption.find(params[:id])
    response = {title: adoption.title, description: adoption.description, user_pet_care: adoption.user_pet_care.name,
                city: adoption.animal.city, animal_type: adoption.animal.animal_type, age: adoption.animal.age, 
                sex: adoption.animal.sex, animal_name: adoption.animal.name}                     
    render status: 200, json: response
  end
end