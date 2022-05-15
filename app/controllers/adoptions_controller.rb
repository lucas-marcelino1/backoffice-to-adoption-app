class AdoptionsController < ApplicationController

    def new
        @adoption = Adoption.new
        @user = current_user_pet_care
    end

    def create
        @user = current_user_pet_care
        @adoption = Adoption.new(params.require(:adoption).permit(:title, :description, :animal_id).merge(user_pet_care_id: @user.id))
        if @adoption.save
            redirect_to root_path, notice: 'Adoção cadastrada com sucesso'
        else
            flash.now[:notice] = 'Adoção falhou!'
            render 'new'
        end
    end

    def show
        @adoption = Adoption.find(params[:id])
    end

end