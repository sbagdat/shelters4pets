class AddPetsCountToShelters < ActiveRecord::Migration[6.1]
  def change
    add_column :shelters, :pets_count, :integer, default: 0
  end
end
