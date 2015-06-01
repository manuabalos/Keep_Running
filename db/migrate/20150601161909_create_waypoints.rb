class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|

    	t.integer :route_id
    	t.float :latitude
    	t.float :longitude

      t.timestamps null: false
    end
  end
end
