class CategoryIdea < ActiveRecord::Base
    belongs_to :category
    belongs_to :idea

    # return array of rows where the category id is in the idea's categories
    # (only unique ideas are returned, ie. no duplicates)
    def self.find_ideas_by_categories (ids_arr)
        self.where(:category_id => ids_arr).select("idea_id").uniq
    end
end

