class AddVetIdToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :vet_id, :integer
  end
end
