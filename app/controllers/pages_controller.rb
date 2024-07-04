# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def index
    @genres = Genre.pluck(:name).prepend('All')
    @results = []  # Initialize @results if needed
    render 'home'
  end

  def about
  end

  def home
    @genres = Genre.pluck(:name).prepend('All')
    @results = []  # Initialize @results if needed
  end

  def search
    @query = params[:query]
    @genre = params[:genre]
    @results = []

    # Ensure @genres is initialized here
    @genres = Genre.pluck(:name).prepend('All')

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
end
