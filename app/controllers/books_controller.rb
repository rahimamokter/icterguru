class BooksController < ApplicationController
   
    def index
        @books = Book.all
        

    end

    def show
        #byebug

        @book = Book.find(params[:id])

    end
end