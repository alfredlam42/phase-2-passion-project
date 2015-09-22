class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string  :start_location_address
      t.string  :start_location_city
      t.string  :start_location_state
      t.integer :distance
      t.string  :title
      t.string  :pace
      t.date    :date
      t.string    :start_time
      t.references  :creator
      t.timestamps
    end
  end
end
