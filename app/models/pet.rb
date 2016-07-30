class Pet < ApplicationRecord
	validates :name, presence:true, length:{minimum:3, maximum:15}
	validates :animal, presence:true
	validates :vet_id, presence:true

	belongs_to :vet
	has_many :appointments
end
