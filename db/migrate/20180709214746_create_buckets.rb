class CreateBuckets < ActiveRecord::Migration
  def up
    create_table :buckets do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.timestamps null: false
    end
  end

  def down
    drop_table :buckets
  end

end
