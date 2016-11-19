class AppointmentsController < ApplicationController
  before_action :set_pet
  before_action :set_appointment, except: [:index, :new, :create]

  def index
    @appontments = @pet.appointments.all
  end

  def new
    @appointment = @pet.appointments.new
  end

  def create
    @appointment = @pet.appointments.new(appointment_params)
    if @appointment.save
      redirect_to pet_appointment_path(@pet, @appointment)
    else
      render :new
    end
  end

  def show
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to pet_appointment_path(@pet, @appointment)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @appointment.destroy
    redirect_to pet_appointments_path(@pet)
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_appointment
    @appointment = @pet.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:pet_id, :date, :time, :location, :notes, :title)
  end
end
