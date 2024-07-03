class AddGenreToBooks < ActiveRecord::Migration[7.1]
  def change
    add_reference :books, :genre, foreign_key: true, null: true
  end
end
