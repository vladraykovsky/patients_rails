class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :surname
      t.string :dateOfBirth
      t.string :sex
      t.string :country
      t.string :state

      t.timestamps
    end
  end
end
