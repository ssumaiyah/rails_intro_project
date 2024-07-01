class CreateBookPublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :book_publishers do |t|
      t.references :book, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
    add_index :book_publishers, [:book_id, :publisher_id], unique: true
  end
end
