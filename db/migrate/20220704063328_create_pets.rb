class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :species
      t.integer :age
      t.integer :price
      t.string :name
      t.string :description
      t.boolean :sold, default: false
      
      t.timestamps
    end
  end
end
