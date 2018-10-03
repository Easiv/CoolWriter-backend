class CreateBookUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :book_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.timestamps
    end
  end
end
