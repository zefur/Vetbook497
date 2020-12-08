class PetsController < ApplicationController
    before_action :set_default

    def show
        @pet = Pet.find(params[:id])
    end

    def new
        @pet = Pet.new
        authorize @pet
    end
    
    def edit
        authorize @pet
    end
    
    def create
        @pet = Pet.new(pet_params)
        authorize @pet
        @pet.user = current_user

        if @pet.save
          puts "printed"
            redirect_to owner_path(current_user), notice: "Your family has grown =]"
        else
            render :new
        end
    end

    def update
        authorize @pet
        if @pet.update(pet_params)
            redirect_to @pet, notice: 'Successfully updated'
        else
            render :edit
        end
    end

    def destroy

        authorize @pet
        @pet.destroy
        redirect_to pets_path, notice: 'Successfully deleted'

    end

    private

    def pet_params
        params.require(:pet).permit(:name,:gender, :species, :dob ,:breed,:species,:notes, :photo)
    end


    def set_default
        @owner = current_user
    end
end
