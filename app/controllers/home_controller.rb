class HomeController < ApplicationController

    def index
        @animals = Animal.all
    end



end