class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :vet_id
      t.integer :pet_id
      t.datetime :when

      t.timestamps
    end
  end
end
