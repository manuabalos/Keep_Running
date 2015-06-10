class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
		t.belongs_to :route, index: true
    	t.belongs_to :user, index: true
    	t.date :date
      t.timestamps null: false
    end
  end
end
