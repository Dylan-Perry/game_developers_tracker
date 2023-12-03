class CreateDevs < ActiveRecord::Migration[7.0]
  def change
    create_table :devs do |t|
      t.string :name
      t.integer :employees
      t.boolean :operational

      t.timestamps
    end
  end
end
