class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string  :start_location
      t.integer :distance
      t.date    :date
      t.string    :start_time
      t.references  :creator
      t.timestamps
    end
  end
end
