class Vet < ApplicationRecord
	validates :name, presence:true, length:{minimum:4, maximum:10}
	validates :years, presence:true, inclusion:5..50

	has_many :pets
	has_many :appointments
end
