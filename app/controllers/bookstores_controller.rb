class BookstoresController < ApplicationController
  before_action :set_bookstore, only: [:show, :edit, :update, :destroy]

  # GET /bookstores
  def index
    @bookstores = Bookstore.page(params[:page]).per(10)
  end

  # GET /bookstores/1
  def show
    @bookstore = Bookstore.includes(:books).find(params[:id])
  end

  # GET /bookstores/new
  def new
    @bookstore = Bookstore.new
  end

  # GET /bookstores/1/edit
  def edit
    @bookstore = Bookstore.find(params[:id])
  end

  # POST /bookstores
  def create
    @bookstore = Bookstore.new(bookstore_params)

    if @bookstore.save
      redirect_to @bookstore, notice: 'Bookstore was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookstores/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookstores/1
  def destroy
    @bookstore.destroy
    redirect_to bookstores_url, notice: 'Bookstore was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookstore
    @bookstore = Bookstore.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bookstore_params
    params.require(:bookstore).permit(:name, :location, :description)
  end
end
