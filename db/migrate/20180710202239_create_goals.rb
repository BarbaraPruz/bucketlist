class CreateGoals < ActiveRecord::Migration
  def up
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.integer :bucket_id
      t.timestamps null: false
    end
  end

  def down
    drop_table :goals
  end

end
