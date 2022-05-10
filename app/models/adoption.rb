class Adoption < ApplicationRecord
    has_many :animals
    validates :animal_id, presence: true
    validates :animal_id, uniqueness: true
end
