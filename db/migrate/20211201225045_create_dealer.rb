class CreateDealer < ActiveRecord::Migration[5.2]
  def change
    create_table :dealers do |t|
      t.string :name
      t.boolean :open
      t.integer :zip

      t.timestamps
    end
  end
end
