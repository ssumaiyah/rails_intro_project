class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if Book.exists?(title: @book.title, author_id: @book.author_id)
      redirect_to new_book_path, alert: 'Book with this title and author already exists.'
    elsif @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :cover_image)
  end
end
