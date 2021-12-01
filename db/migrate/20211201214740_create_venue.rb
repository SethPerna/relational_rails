class CreateVenue < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :capacity
      t.boolean :indoor
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
