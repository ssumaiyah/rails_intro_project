class PublishersController < ApplicationController
    def index
      @publishers = Publisher.page(params[:page])
    end
  
    def show
      @publisher = Publisher.find(params[:id])
    end
  end