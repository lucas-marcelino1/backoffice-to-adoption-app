class Api::V1::AdoptionsController < ActionController::API
  def index
    adoptions = Adoption.joins(:animal).where('animals.adopted is FALSE')
    response = []
    adoptions.each do |adoption|
      response << {id: adoption.id, title: adoption.title, description: adoption.description,
                   city: adoption.animal.city, animal_type: adoption.animal.animal_type, animal_id: adoption.animal.id
                  }
    end
    render status: 200, json: response
  end

  def show
    adoption = Adoption.find(params[:id])
    response = {id: adoption.id, title: adoption.title, description: adoption.description, user_pet_care: adoption.user_pet_care.name,
                city: adoption.animal.city, animal_type: adoption.animal.animal_type, age: adoption.animal.age, 
                sex: adoption.animal.sex, animal_name: adoption.animal.name, animal_id: adoption.animal.id}                     
    render status: 200, json: response
  end

  def adopt
    adoption = Adoption.find(params[:id])
    adoption.animal.update(adopted: true)
    render status: 200, json: {message: "Animal adotado com sucesso! Esperamos que você e #{adoption.animal.name} sejam muito felizes."}
  end
end