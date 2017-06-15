class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total
      t.belongs_to :user
      t.timestamps
    end
  end
end
