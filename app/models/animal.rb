class Animal < ApplicationRecord
    validates :name, :sex, :age, :city, :pet_care, presence: true
    
end
