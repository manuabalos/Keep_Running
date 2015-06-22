class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|

    	t.string :name
    	t.text :description
      t.text :location
    	t.string :difficulty
      t.float :distance
    	t.float :latitude
    	t.float :longitude
    	t.float :origin_lat
    	t.float :origin_lng
    	t.float :destination_lat
    	t.float :destination_lng

      t.timestamps null: false
    end
  end
end
