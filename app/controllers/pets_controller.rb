class PetsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @available_pets = Pet.available_pets

    unless params[:min_age].blank?
      @available_pets = @available_pets.where('age >= ?', params[:min_age])
    end

    unless params[:max_age].blank?
      @available_pets = @available_pets.where('age <= ?', params[:max_age])
    end

    if params[:species]!= 'all' && !params[:species].blank?
      @available_pets = @available_pets.where(species: params[:species])
    end
  end

  def show
  end

  def new
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.find(params[:id])

  end

  def update
    @pet = Pet.find(params[:id])
    if current_user != @pet.User
      # throw an error
      return
    else
      @pet.update(**pet_params)
      redirect_to @pet
    end
  end

  def destroy
    Pet.destroy(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:age, :price, :species)
  end

end
