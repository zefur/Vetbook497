class PetsController < ApplicationController
    before_action :set_default
    def new
        @pet = Pet.new
    end

    def create
        @pet = Pet.new(pet_params)
        @pet.user = current_user

        if @pet.save
            redirect_to user_path(current_user), notice: "Your family has grown =]"
        else

            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        if @pet.update(pet_params)
            redirect_to @pet, notice: 'Successfully updated'
        else
            render :edit
        end
    end

    def destroy

    end
    private

    def pet_params
        params.require(:pet).permit(:name,:gender, :species, :DOB,:breed,:species,:notes, :photo)
    end


    def set_default
        @user = current_user
        # @pet = Pet.find(params[:id])
    end
end
