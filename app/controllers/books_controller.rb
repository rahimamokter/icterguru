class BooksController < ApplicationController
   
    def index
        @books = Book.all


    end

    def show
        #byebug

        @book = Book.find(params[:id])

    end

    def new
    
        @book = Book.new 

    end

    def edit
        @book = Book.find(params[:id])
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
        @book = Book.find(params[:id])
        if @book.update(params.require(:book).permit(:title, :description))
            flash[:notice] = "The book entry was updated successfully."
            redirect_to book_path(@book)
        else
          render 'edit'
        end
        
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to @book
    end


end