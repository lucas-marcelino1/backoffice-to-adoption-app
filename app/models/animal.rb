class Animal < ApplicationRecord
    has_one :adoption
    validates :name, :sex, :age, :city, :pet_care, presence: true
end
