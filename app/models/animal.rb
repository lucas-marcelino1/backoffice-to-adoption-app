class Animal < ApplicationRecord
    has_one :adoption
    belongs_to :user_pet_care
    validates :name, :age, :city, :user_pet_care, presence: true
    
end
