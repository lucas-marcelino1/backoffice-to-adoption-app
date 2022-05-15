class Animal < ApplicationRecord
    has_one :adoption
    belongs_to :user_pet_care
    validates :name, :sex, :age, :city, :user_pet_care, presence: true
    validates_associated :adoption
end
