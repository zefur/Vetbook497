class UsersController < ApplicationController
    before_action :set_user
    def dash

    end

    def show

    end

    private

    def user_params
        params.require(:user).permit(:first_name,:last_name,:location,:phone_number)
    end
    
    def set_user
        @user = current_user
    end
end
