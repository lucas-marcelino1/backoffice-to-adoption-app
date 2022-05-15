class Adoption < ApplicationRecord
    belongs_to :animal
    belongs_to :user_pet_care
    validates :animal_id, :title, presence: true
    validates :animal_id, uniqueness: true
    validates :title, length: {maximum: 40}
end
