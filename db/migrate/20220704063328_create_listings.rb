class CreateListings < ActiveRecord::Migration[7.0]

  def change
    create_table :listings do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.integer :price
      t.string :description
      t.boolean :sold, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
