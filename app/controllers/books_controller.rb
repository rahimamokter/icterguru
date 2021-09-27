class BooksController < ApplicationController
   
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    #before_action :set_book, only: %i[ show edit update destroy ]
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    public
    
    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :description)
    end


    def index
        @books = Book.all

    end

    def show
        #byebug
        #@book = Book.find(params[:id])
        # moved to the set_book method 
    end

    def new
        @book = Book.new 
    end

    def edit
    
    end

    def create 
        @book = Book.new(params.require(:book).permit(:title, :description))
       # render plain: params[:book]
        if  @book.save
            flash[:notice] = "The book entry was created and saved successfully."
            redirect_to book_path(@book)
            #redirect_to @book # In sortcut
        else
            render 'new'
      end
        
       
    end

    def update 
        
        if @book.update(params.require(:book).permit(:title, :description))
            flash[:notice] = "The book entry was updated successfully."
            redirect_to book_path(@book)
        else
          render 'edit'
        end
        
    end

    def destroy
        @book.destroy
        redirect_to @book
    end



end