class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user
      t.string :name
      t.text :explanation
      t.integer :category_id
      t.integer :quality_id
      t.integer :shipping_cost_id
      t.integer :area_id
      t.integer :shipping_date_id
      t.integer :price
      t.timestamps
    end
  end
end
