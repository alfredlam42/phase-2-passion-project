class CreateRsvp < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.references  :participant
      t.references  :route
      t.timestamps
    end
  end
end
