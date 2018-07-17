joe = User.create(:name => "Joe", :email => "joe@domain.com", :password => "test")
b1 = Bucket.create(:name => "Lifetime", :description => "What I want to do in my life!")
b2 = Bucket.create(:name => "Family", :description => "What I want to do with my family")
g1 = Goal.create(:title => "St Andrews Golf", :description => "Play golf at Saint Andrews (Scotland)", :completed => false)
g2 = Goal.create(:title => "Baseball", :description => "Take my kids to a major league baseball game", :completed => false)
g3 = Goal.create(:title => "Camp", :description => "Family camping in the Grand Tetons", :completed => false)
b1.goals << g1
b2.goals << g2
b2.goals << g3
joe.buckets << b1
joe.buckets << b2
joe.save

martha = User.create(:name => "Martha", :email => "martha@domain.com", :password => "test")
b3 = Bucket.create(:name => "My Goals")
g4 = Goal.create(:title => "Italy", :description =>"Visit Italy", :completed => false)
b3.goals << g4
martha.buckets << b3
martha.save

natural_wonder = Category.create(:name => "Natural Wonders")
event = Category.create(:name => "Events")
activity = Category.create(:name => "Activities")
learn = Category.create(:name => "Learn")
outdoor = Category.create(:name => "Outdoor")
art = Category.create(:name => "Art & Architecture")
entertainment = Category.create(:name => "Entertainment")
sports = Category.create(:name => "Sports") 

grand_canyon = Idea.create(:name => "Grand Canyon",
    :description=>"The South Rim is open all year. The North Rim closed in winter (starting in October).",
    :url=>"https://www.grandcanyon.org/", 
    :image_url=>"https://www.nps.gov/npgallery/GetAsset/F73A9730-155D-451F-67D1A31A2B667B8A/Thumb/XLarge?")
northern_lights = Idea.create(:name => "Northern Lights",
    :description=>"Aurora",
    :url=>"https://en.wikipedia.org/wiki/Aurora")
super_bowl = Idea.create(:name => "Super Bowl",
    :description=>"NFL annual championship",
    :image_url=>"https://upload.wikimedia.org/wikipedia/en/thumb/2/2e/Super_Bowl_LIII_logo.png/360px-Super_Bowl_LIII_logo.png")
mardi_gras = Idea.create(:name => "Mardi Gras",
    :url=>"http://www.mardigrasneworleans.com/", 
    :image_url=>"http://www.mardigrasneworleans.com/thumb/150/100//uploads/gallery/kingfloat_1488221640.jpg")
hike = Idea.create(:name => "Hike Applachian Trail")
skydive = Idea.create(:name => "Try Skydiving",
    :image_url=>"https://images.pexels.com/photos/39608/tandem-skydivers-skydivers-teamwork-cooperation-39608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
olympics = Idea.create(:name=>"Olympics",
    :description=>"Tokyo 2020",
    :url=>"https://www.olympic.org/")
broadway = Idea.create(:name=>"Broadway NYC",
    :description=>"See a Broadway play or musical")
lascala = Idea.create(:name=>"La Scala",
    :description=>"See an opera at Las Scala in Milan",
    :image_url=>"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Milan_-_Scala_-_Facade.jpg/375px-Milan_-_Scala_-_Facade.jpg")
rosebowlparade = Idea.create(:name=>"Rose Bowl Parade",
    :description=>"Pasadena, Ca.  New Years Day")
sistinechapel = Idea.create(:name=>"Sistine Chapel",
    :description=>"Visit the Sistine Chapel")
scuba = Idea.create(:name=>"Scuba Dive the Greate Barrier Reef",
    :url=>"https://en.wikipedia.org/wiki/Great_Barrier_Reef")
language = Idea.create(:name=>"Learn a 2nd Language")
pie = Idea.create(:name=>"Bake a pie from scratch")
louvre=Idea.create(:name=>"Visit the Louvre Art Museum")

CategoryIdea.create( :category_id=>natural_wonder.id, :idea_id=>grand_canyon.id)
CategoryIdea.create( :category_id=>outdoor.id, :idea_id=>grand_canyon.id)  
CategoryIdea.create( :category_id=>natural_wonder.id, :idea_id=>northern_lights.id)
CategoryIdea.create( :category_id=>outdoor.id, :idea_id=>northern_lights.id)
CategoryIdea.create( :category_id=>sports.id, :idea_id=>super_bowl.id)
CategoryIdea.create( :category_id=>event.id, :idea_id=>super_bowl.id)
CategoryIdea.create( :category_id=>event.id, :idea_id=>mardi_gras.id)
CategoryIdea.create( :category_id=>entertainment.id, :idea_id=>mardi_gras.id)
CategoryIdea.create( :category_id=>activity.id , :idea_id=>hike.id)
CategoryIdea.create( :category_id=>outdoor.id, :idea_id=>hike.id)
CategoryIdea.create( :category_id=>activity.id, :idea_id=>skydive.id)
CategoryIdea.create( :category_id=>outdoor.id , :idea_id=>skydive.id)
CategoryIdea.create( :category_id=>learn.id, :idea_id=>skydive.id)
CategoryIdea.create( :category_id=>event.id , :idea_id=>olympics.id)
CategoryIdea.create( :category_id=>sports.id , :idea_id=>olympics.id)
CategoryIdea.create( :category_id=>entertainment.id, :idea_id=>broadway.id)
CategoryIdea.create( :category_id=>entertainment.id, :idea_id=>lascala.id)
CategoryIdea.create( :category_id=>event.id, :idea_id=>rosebowlparade.id)
CategoryIdea.create( :category_id=>art.id, :idea_id=>sistinechapel.id)
CategoryIdea.create( :category_id=>outdoor.id , :idea_id=>scuba.id)
CategoryIdea.create( :category_id=>learn.id , :idea_id=>scuba.id)
CategoryIdea.create( :category_id=>activity.id, :idea_id=>scuba.id)
CategoryIdea.create( :category_id=>learn.id, :idea_id=>language.id)
CategoryIdea.create( :category_id=>learn.id, :idea_id=>pie.id)
CategoryIdea.create( :category_id=>art.id, :idea_id=>louvre.id)

