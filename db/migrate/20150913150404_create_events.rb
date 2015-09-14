class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.boolean :host, default: false
      t.references  :participant
      t.references  :route
      t.timestamps
    end
  end
end
