class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|

      t.timestamps null: false
    end
  end
end
