class CreateCategoryIdeas < ActiveRecord::Migration
  def up
    create_table :category_ideas do |t|
      t.integer :category_id
      t.integer :idea_id
    end
  end

  def down
    drop_table :category_ideas
  end

end
