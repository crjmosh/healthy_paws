class MedicalsController < ApplicationController
  before_action :set_pet
  before_action :set_medical, except: [:index, :new, :create]

  def index
    @medicals = @pet.medicals
  end

  def new
    @medical = @pet.medicals.new
  end

  def create
    @medical = @pet.medicals.new(medical_params)
    if @medical.save
      redirect_to pet_medical_path(@pet, @medical), notice: 'Medical History Added!'
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @pet.user_id
			flash[:alert] = "That Isn't Your Pet Change!"
			redirect_to pet_medicals_path(@pet)
		end
  end

  def update
    if @medical.update(medical_params)
      redirect_to pet_medical_path(@pet, @medical), notice: 'Medical History Updated!'
    else
      render :edit
    end
  end

  def destroy
    @medical.destroy
    redirect_to pet_medicals_path(@pet), notice: 'Selected History Deleted!'
  end

  private
    def set_pet
      @pet = Pet.find(params[:pet_id])
    end

    def set_medical
      @medical = @pet.find(params[:id])
    end

    def medical_params
      params.require(:medical).permit(:title, :date, :notes)
    end
end
