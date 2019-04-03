class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.integer :user_id
      t.json :data

      t.timestamps
    end
  end
end
