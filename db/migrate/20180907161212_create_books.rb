class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :cover
      t.string :title
      t.string :author
      t.string :description
      t.integer :page_count

      t.timestamps
    end
  end
end
