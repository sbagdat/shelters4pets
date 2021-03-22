class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :breed, null: false
      t.integer :age, null: false, default: 0
      t.belongs_to :shelter, null: true, foreign_key: true

      t.timestamps
    end
  end
end
