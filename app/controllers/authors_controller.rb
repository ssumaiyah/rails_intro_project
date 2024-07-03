class AuthorsController < ApplicationController
    def index
      @authors = Author.page(params[:page])
    end
  
   
      def show
        @author = Author.includes(:books).find(params[:id])
      end
    end
    
