class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :kitap, foreign_key: true
      t.integer :sayi

      t.timestamps
    end
  end
end
