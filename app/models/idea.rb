
class Idea <ActiveRecord::Base
    has_many :category_ideas
    has_many :categories, through: :category_ideas

    # return array of Ideas that have category in category ids
    def self.find_by_categories (category_ids)
        CategoryIdea.find_ideas_by_categories(category_ids).map { |row| Idea.find(row.idea_id) }
    end

end