class CreateVets < ActiveRecord::Migration[5.0]
  def change
    create_table :vets do |t|
      t.string :name
      t.integer :years

      t.timestamps
    end
  end
end
