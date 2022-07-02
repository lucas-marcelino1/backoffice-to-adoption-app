class AdoptionsController < ApplicationController
    before_action :authenticate_user_pet_care!
    before_action :set_adoption_and_check_user, only: [:destroy, :show]

    def new
        @adoption = Adoption.new
        @user = current_user_pet_care
        @animals = @user.animals
    end

    def index
        @adoptions = current_user_pet_care.adoptions
    end

    def create
        @user = current_user_pet_care
        @adoption = Adoption.new(params.require(:adoption).permit(:title, :description, :animal_id).merge(user_pet_care_id: @user.id))
        if @adoption.save
            redirect_to adoptions_path, notice: 'Adoção cadastrada com sucesso!'
        else
            flash.now[:notice] = 'Adoção falhou!'
            @animals = @user.animals
            render 'new'
        end
    end

    def destroy

        if @adoption.delete
            redirect_to(root_path, notice: 'Adoção cancelada com sucesso!')
        else
            flash.now[:notice] = "Não foi possível cancelar a adoção"
            render 'show'
        end
    end

    def show
    end

    private 
    
    def set_adoption_and_check_user
        @adoption = Adoption.find(params[:id])
        if @adoption.user_pet_care != current_user_pet_care
            return redirect_to(root_path, notice: 'Não foi possível completar a ação.')
        end
    end

end