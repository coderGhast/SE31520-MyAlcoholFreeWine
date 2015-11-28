class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.text :description
      t.boolean :suitable_for_vegetarians
      t.string :bottle_size
      t.string :country_of_origin
      t.string :grape_type
      t.string :supplier
      t.decimal :price
      t.string :image_url

      t.timestamps null: false
    end
  end
end
