class PetsController < ApplicationController
    before_action :set_default
    # skip_before_action :verify_authenticity_token, except: [:create,:destroy]

    def new
        @pet = Pet.new
    end

    def create
        @pet = Pet.new(pet_params)
        @pet.user = current_user

        if @pet.save
          puts "printed"
            redirect_to owner_path(current_user), notice: "Your family has grown =]"
        else
            render :new
        end
    end

    def show
        @pet = Pet.find(params[:id])
    end



    def update
        if @pet.update(pet_params)
            redirect_to @pet, notice: 'Successfully updated'
        else
            render :edit
        end
    end

    def destroy
       @pet = Pet.find(params[:id])
       @pet.destroy
       redirect_to owner_path(current_user)
    end

    private

    def pet_params
        params.require(:pet).permit(:name,:gender, :species, :dob ,:breed,:species,:notes, :photo)
    end


    def set_default

        @owner = current_user

    end
end
