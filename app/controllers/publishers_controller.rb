class PublishersController < ApplicationController
    def index
      @publishers = Publisher.page(params[:page]).per(15)
      @genres = Genre.all 
    end
 
    def show
      @publisher = Publisher.find(params[:id])
      @books = @publisher.books
    end
  end