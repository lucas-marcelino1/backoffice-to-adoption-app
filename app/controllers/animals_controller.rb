class AnimalsController < ApplicationController

    def new
        @animal = Animal.new()
    end

    def create
        @animal = Animal.new(params.require(:animal).permit(:name, :sex, :age, :city, :pet_care))
        if @animal.save
            redirect_to(root_path, notice: 'Animal cadastrado para adoção!')

        else
            flash.now[:notice] = 'Verifique os erros abaixo'
            render 'new'
        end
    end

    def show
        @animal = Animal.find(params[:id])
    end
end