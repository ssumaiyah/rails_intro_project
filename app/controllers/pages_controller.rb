# app/controllers/pages_controller.rb
class PagesController < ApplicationController
    def index
      @results = []
      render 'home'
    end
  
    def about
    end
  
    def search
      @query = params[:query]
      @results = Author.where('name LIKE ?', "%#{@query}%") +
                 Book.where('title LIKE ?', "%#{@query}%") +
                 Genre.where('name LIKE ?', "%#{@query}%") +
                 Publisher.where('name LIKE ?', "%#{@query}%")
    end
  end
  