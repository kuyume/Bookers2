class BooksController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @books = Book.all
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "successfully"
            redirect_to book_path(@book)
        else
            @books = Book.all
            render :index
        end
    end
    
    def show
        @book = Book.find(params[:id])
        @user = User.find(@book.user_id)
    end
  
    def edit
        @book = Book.find(params[:id])
        if @book.user_id == current_user.id
        else
            redirect_to user_path(current_user)
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "successfully"
            redirect_to book_path(@book)
        else
            flash[:notice] = "error"
            render :edit
        end
    end
    
    def destroy
        book = Book.find(params[:id])
        if book.user_id == current_user.id
            book.destroy
           redirect_to books_path
        else
        redirect_to user_path(current_user)
        end
    end
    
    
    private
    
    def book_params
        params.require(:book).permit(:title, :imp)
    end
    
end
