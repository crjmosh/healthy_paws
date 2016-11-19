class PetsController < ApplicationController
  before_action :set_pet, except: [:index, :new, :create]

  def index
  	@pets = current_user.pets.all
  end

  def new
  	@pet = current_user.pets.new
  end

  def create
  	@pet = current_user.pets.new(pet_params)
  	if @pet.save
  		redirect_to pet_path(@pet), notice: 'Pet added successfully!'
  	else
  		render :new, alert: @pet.errors.full_messages
  	end
  end

  def show
  end

  def edit
  	if current_user.id != @pet.user_id
      flash[:error] = 'That pet does not belong to you!'
      redirect_to pets_path
    end
  end

  def update
  	if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit, alert: @pet.errors.full_messages
    end
  end

  def destroy
  	if current_user.id != @pet.user_id
      flash[:error] = 'That pet does not belong to you!'
      redirect_to pets_path
    else
      @pet.destroy
      redirect_to pets_path
    end
  end

  private
  	def set_pet
  		@pet = Pet.find(params[:id])
  	end

  	def pet_params
  		params.require(:pet).permit(:name, :dob, :species, :breed,
  																:microchip, :primary_vet, :fixed,
  																:picture, :notes, :gender)
  	end
end
