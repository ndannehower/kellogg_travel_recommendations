class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :trip
      t.integer :year_id

      t.timestamps

    end
  end
end
