class BooksController < ApplicationController
 

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      
      redirect_to book_path(@book.id)
    else @books = Book.all.order(id: :asc)
      render :index
    end
  end
    
  def index
    @book = Book.new
    @books = Book.all
    
  end

  def edit
    Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id]) 
  end
  
  def destroy
    book = Book.find(params[:id]) 
    book.destroy 
    redirect_to '/books' 
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
