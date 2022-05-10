class AnimalsController < ApplicationController
    before_action :set_animal, only: [:show, :edit, :update, :destroy]

    def index
        @animals = Animal.all
    end

    def new
        @animal = Animal.new()
    end

    def create
        @animal = Animal.new(params.require(:animal).permit(:name, :sex, :age, :city, :pet_care))
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
        if @animal.destroy
            redirect_to(animals_path, notice: 'Animal excluído com sucesso!')
        end
    end

    def update

        if @animal.update(params.require(:animal).permit(:name, :sex, :age, :city, :pet_care))
            redirect_to(animal_path(@animal.id), notice: 'Adoção editada com sucesso')
        else
            flash.now[:notice] = 'Não foi possível realizar a edição'
            render 'new'
        end
    end

    private

    def set_animal
        @animal = Animal.find(params[:id])
    end
end