class BooksController < ApplicationController
  def index
    @books = Book.includes(:author, :genres).page(params[:page])
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :author_id, :cover_image)
  end
end
