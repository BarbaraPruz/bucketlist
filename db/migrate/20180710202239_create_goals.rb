class CreateGoals < ActiveRecord::Migration
  def up
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.integer :bucket_id
      t.string :url
      t.string :image_url
      t.timestamps null: false
    end
  end

  def down
    drop_table :goals
  end

end
