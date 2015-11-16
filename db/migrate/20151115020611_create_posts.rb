class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.decimal :price
      t.string :external_url
      t.string :make
      t.string :model
      t.string :year
      t.string :mileage
      t.string :ext_color
      t.string :int_color
      t.string :bodystyle
      t.string :door
      t.string :drivenwheels
      t.string :engine
      t.string :vin
      t.string :fuel

      t.string :timestamp

      t.timestamps null: false
    end
  end
end
