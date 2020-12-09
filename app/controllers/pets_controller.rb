class PetsController < ApplicationController
    before_action :set_default

 

    def new
        @pet = Pet.new
        authorize @pet
    end
    

    
    def create
        @pet = Pet.new(pet_params)
        authorize @pet
        @pet.user = current_user

        if @pet.save
          puts "printed"
            redirect_to owner_path(@owner), notice: "Your family has grown =]"
        else
            render :new
        end
    end



    def show
        
    end


     def edit
        @pet = Pet.find(params[:id])
        authorize @pet
    end

    def update
        authorize @pet
        if @pet.update(pet_params)
            redirect_to owner_path(@owner), notice: 'Successfully updated'
        else
            render :edit
        end
    end
    def delete_photo
        
        @pet.photo.purge
    end

    def destroy

        @pet = Pet.find(params[:id])
        authorize @pet
        @pet.destroy
        redirect_to owner_path(@owner), notice: 'Successfully deleted'


    end

    private

    def pet_params
        params.require(:pet).permit(:name,:gender, :species, :dob ,:breed,:species,:notes, :photo)
    end


    def set_default
        @owner = current_user
    end
end
