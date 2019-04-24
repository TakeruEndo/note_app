class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
  end

  def show
    @book =  Book.find(params[:id])    
  end

  def create
    
  end

end
