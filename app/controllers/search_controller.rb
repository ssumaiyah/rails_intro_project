# app/controllers/search_controller.rb
def search
  @query = params[:query]
  @category = Category.find(params[:category]) if params[:category].present?

  if @category
    @results = @category.books.where("title LIKE?", "%#{@query}%")
  else
    @results = Book.where("title LIKE?", "%#{@query}%")
  end

  # Add additional search logic for authors, etc.
end