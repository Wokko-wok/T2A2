class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :species
      t.integer :age
      t.integer :price
      t.string :name
      t.boolean :sold

      t.timestamps
    end
  end
end
