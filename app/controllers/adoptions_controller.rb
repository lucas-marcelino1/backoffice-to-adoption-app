class AdoptionsController < ApplicationController

    def new
        @adoption = Adoption.new
    end

    def create
        @adoption = Adoption.new(params.require(:adoption).permit(:title, :description, :animal_id))
        if @adoption.save
            redirect_to root_path, notice: 'Adoção cadastrada com sucesso'
        else
            flash.now[:notice] = 'Adoção falhou!'
            render 'new'
        end
    end

end