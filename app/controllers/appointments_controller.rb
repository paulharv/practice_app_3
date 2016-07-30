class AppointmentsController < ApplicationController
  def new
  	@pet = Pet.find params[:pet_id]
  	@appointment = Appointment.new(pet:@pet, vet:@pet.vet)
  end

  def create
  	@appointment = Appointment.new(appointment_params)
  	if @appointment.save
  		redirect_to @appointment.pet
  	else
  		render :new
  	end
  end

  def edit
  end

  private
  	def appointment_params
  		params.require(:appointment).permit([:pet_id, :vet_id, :when])
  	end
end
