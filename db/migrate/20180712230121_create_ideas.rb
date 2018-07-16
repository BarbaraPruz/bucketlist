class CreateIdeas < ActiveRecord::Migration

  def up
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :image_url
    end
  end
  
  def down
    drop_table :ideas
  end
end
