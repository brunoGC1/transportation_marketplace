class CreateTransportations < ActiveRecord::Migration[7.0]
  def change
    create_table :transportations do |t|
      t.string :brand
      t.string :brand_model
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
