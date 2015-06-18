class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :uid
      t.string :name
      t.string :provider
      t.text :photo
      t.integer :age, :default => 27
      t.text :location, :default => "Madrid"
      t.integer :level, :default => 1
      t.integer :experience, :default => 0

      t.timestamps null: false
    end
  end
end
