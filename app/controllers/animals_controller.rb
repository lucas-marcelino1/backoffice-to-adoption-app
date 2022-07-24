class AnimalsController < ApplicationController
    before_action :authenticate_user_pet_care!
    before_action :set_animal_and_check_user, only: [:show, :edit, :update, :destroy]
    

    def index
        @animals = current_user_pet_care.animals
    end

    def new
        @animal = Animal.new()
        @user = current_user_pet_care
    end

    def create
        @user = current_user_pet_care
        @animal = Animal.new(params.require(:animal).permit(:name, :sex, :age, :city, :animal_type, :image).merge(user_pet_care_id: @user.id))
        if @animal.save
            redirect_to(animals_path, notice: 'Animal cadastrado com sucesso!')

        else
            flash.now[:notice] = 'Verifique os erros abaixo'
            render 'new'
        end
    end

    def show 
    end

    def edit
    end

    def destroy
        if @animal.adoption.nil?
            @animal.destroy!
            redirect_to(animals_path, notice: 'Animal excluído com sucesso!')
        else
            flash.now[:notice] = 'Não foi possível excluir o animal. Ele está em adoção.'
            render 'show'
        end
    end

    def update

        if @animal.update(params.require(:animal).permit(:name, :sex, :age, :city, :animal_type).merge(user_pet_care: current_user_pet_care))
            redirect_to(animal_path(@animal.id), notice: 'Animal editado com sucesso')
        else
            flash.now[:notice] = 'Não foi possível realizar a edição'
            render 'new'
        end
    end

    private

    def set_animal_and_check_user
        @animal = Animal.find(params[:id])
        if current_user_pet_care != @animal.user_pet_care
            redirect_to(root_path, notice: 'Não foi possível realizar a ação!')
        end
    end
end