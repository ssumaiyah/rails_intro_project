class BooksController < ApplicationController
  before_action :set_genres
  def index
    @books = Book.includes(:author, :genres).page(params[:page])
    
      @genres = Genre.all
    
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
  private

  def set_genres
    @genres = Genre.all
  end
  def search
    @genres = Genre.all
    if params[:query].present?
      @results = Book.includes(:author, :genres).where("title LIKE ?", "%#{params[:query]}%")
      @results = @results.where(genre_id: params[:genre_id]) if params[:genre_id].present?
    else
      @results = []
    end
  end
end
