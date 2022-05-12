class Animal < ApplicationRecord
    has_one :adoption
    belongs_to :pet_care
    validates :name, :sex, :age, :city, :pet_care, presence: true
    validates_associated :adoption
end
