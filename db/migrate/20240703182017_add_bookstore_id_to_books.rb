class AddBookstoreIdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :bookstore_id, :integer
  end
end
