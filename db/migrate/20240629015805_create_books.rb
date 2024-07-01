class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
    add_index :books, [:title, :author_id], unique: true
  end
end
