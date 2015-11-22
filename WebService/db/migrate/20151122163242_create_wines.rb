class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :price, precision:8, scale:2
      t.string :country_of_origin
      t.string :grape_type
      t.boolean :suitable_for_vegetarians
      t.string :bottle_size

      t.timestamps null: false
    end
  end
end
