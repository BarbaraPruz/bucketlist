class Idea <ActiveRecord::Base
    has_many :category_ideas
    has_many :categorys, through: :category_ideas
end