class PetsController < ApplicationController
before_filter :set_vets, only:[:new, :edit]
before_filter :find_pet, only:[:show, :edit, :update, :destroy]

  def index
  	@pets = Pet.all
  end

  def new
  	@pet = Pet.new
  end

  def create
  	@pet = Pet.new(pet_params)
  	if @pet.save
  		redirect_to :root
  	else
      set_vets
  		render :new
  	end
  end

  def show

  end

  def edit
  end

  def update
  	@pet.attributes = pet_params
    if @pet.save
      redirect_to '/pets'
    else
      set_vets
      render :edit
    end
  	
  end

  def destroy
  	@pet.destroy
  	redirect_to '/pets'
  end

  private

  	def pet_params
  		params.require(:pet).permit([:name, :animal, :vet_id])
  	end

  	def set_vets
  		@vets = Vet.all.map{|v|[v.name, v.id]}
  	end

    def find_pet
      @pet = Pet.find params[:id]
    end
end
