class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price
      t.integer :inventory
      t.belongs_to :category
      t.timestamps
    end
  end
end
