class HomeController < ApplicationController

    def index
        @adoptions = Adoption.all
    end



end