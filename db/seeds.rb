lucy = User.create(:name => "Lucy", :email => "lucy@domain.com", :password => "test")
b1 = Bucket.create(:name => "Lifetime", :description => "What I want to do in my life!")
b2 = Bucket.create(:name => "Family", :description => "What I want to do with my family")
g1 = Goal.create(:title => "Show Business", :description => "Be in a show at Ricky's club")
g2 = Goal.create(:title => "Birthday Party", :description => "Have superman at Little Ricky's party")
g3 = Goal.create(:title => "Country", :description => "Raise Little Ricky in the country")
b1.goals << g1
b2.goals << g2
b2.goals << g3
lucy.buckets << b1
lucy.buckets << b2
lucy.save

ethel = User.create(:name => "Ethel", :email => "ethel@domain.com", :password => "test")
b3 = Bucket.create(:name => "My Goals")
g4 = Goal.create(:title => "New Dress", :description =>"Get Fred to buy me a new dress")
b3.goals << g4
ethel.buckets << b3
ethel.save

natural_wonder = Category.create(:name => "Natural Wonders")
event = Category.create(:name => "Events")
cultural =  Category.create(:name => "Cultural")
activity = Category.create(:name => "Activities")

grand_canyon = Idea.create(:name => "Grand Canyon")
northern_lights = Idea.create(:name => "Northern Lights")
super_bowl = Idea.create(:name => "Super Bowl")
mardi_gras = Idea.create(:name => "Mardi Gras")
machu_pichu = Idea.create(:name => "Machu Pichu")
hike = Idea.create(:name => "Hike Applachian Trail")
sail = Idea.create(:name => "Sail South Pacific")

CategoryIdea.create({ category_id: natural_wonder.id, idea_id: grand_canyon.id })
CategoryIdea.create({ category_id: activity.id, idea_id: grand_canyon.id })
CategoryIdea.create({ category_id: natural_wonder.id, idea_id: northern_lights.id })
CategoryIdea.create({ category_id: event.id, idea_id: super_bowl.id })
CategoryIdea.create({ category_id: event.id, idea_id: mardi_gras.id })
CategoryIdea.create({ category_id: cultural.id, idea_id: mardi_gras.id })
CategoryIdea.create({ category_id: cultural.id, idea_id: machu_pichu.id })
CategoryIdea.create({ category_id: activity.id, idea_id: hike.id })
CategoryIdea.create({ category_id: activity.id, idea_id: sail.id })
