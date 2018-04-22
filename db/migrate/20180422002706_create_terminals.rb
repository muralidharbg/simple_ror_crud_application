class CreateTerminals < ActiveRecord::Migration[5.2]
  def change
    create_table :terminals do |t|
      t.string :name
      t.string :description
      t.json :additional_info
      t.timestamps
    end
  end
end
