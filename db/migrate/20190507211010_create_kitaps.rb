class CreateKitaps < ActiveRecord::Migration[5.2]
  def change
    create_table :kitaps do |t|
      t.string :isim
      t.text :ozet
      t.integer :sayfa

      t.timestamps
    end
  end
end
