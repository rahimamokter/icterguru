class BooksController < ApplicationController
   
    def index
       
    end

    def show
        #byebug

        @book = Book.find(params[:id])

    end
end