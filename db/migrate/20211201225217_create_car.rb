class CreateCar < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.boolean :new
      t.integer :year
      t.integer :vin
      t.references :dealer, foreign_key: true

      t.timestamps
    end
  end
end
