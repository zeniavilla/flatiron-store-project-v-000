class Item < ActiveRecord::Base
    has_many :line_items
    belongs_to :category

    def self.available_items
        where("inventory > 0")
    end

    def update_inventory(qty)
        self.inventory -= qty
        self.save
    end
end
