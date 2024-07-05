class PagesController < ApplicationController
  before_action :set_genres, only: [:index, :home, :search, :about]

  def index
    @results = [] 
    render 'home'
  end

  def about
  end
 


  def home
    @featured_books = Book.limit(3)  # Example: Fetching 3 featured books 
    @results = []  
  end

  def search
    @query = params[:query]
    @genre = params[:genre]
    @results = []

    case @genre
    when 'All'
      @results = Book.where('title LIKE ?', "%#{@query}%")
    when 'Author'
      @results = Author.where('name LIKE ?', "%#{@query}%")
    when 'Genre'
      @results = Genre.where('name LIKE ?', "%#{@query}%")
    when 'Publisher'
      @results = Publisher.where('name LIKE ?', "%#{@query}%")
    else
      @results = Book.joins(:genres).where('books.title LIKE ? AND genres.name = ?', "%#{@query}%", @genre)
    end

    render 'search'
  end

  private

  def set_genres
    @genres = Genre.all
  end
end
