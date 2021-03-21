class AddAdoptableToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :adoptable, :boolean, null: false, default: true
  end
end
