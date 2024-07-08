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
    @books = Book.includes(:genres)

    if params[:search].present?
      @books = @books.where("title LIKE ?", "%#{params[:search]}%")
    end

    if params[:genre].present?
      @books = @books.where(genres: { id: params[:genre] })
    end

    render 'pages/searchresults'
  end

  private

  def set_genres
    @genres = Genre.all
  end
end
