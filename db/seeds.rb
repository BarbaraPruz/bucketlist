lucy = User.create(:name => "Lucy", :email => "lucy@domain.com", :password => "test")
b1 = Bucket.create(:name => "Lifetime", :description => "What I want to do in my life!")
b2 = Bucket.create(:name => "Family", :description => "What I want to do with my family")
g1 = Goal.create(:title => "Show Business", :description => "Be in a show at Ricky's club")
g2 = Goal.create(:title => "Birthday Party", :description => "Have superman at Little Ricky's party")
b1.goals << g1
b2.goals << g2
lucy.buckets << b1
lucy.buckets << b2
lucy.save
ethel = User.create(:name => "Ethel", :email => "ethel@domain.com", :password => "test")
b3 = Bucket.create(:name => "My Goals")
g3 = Goal.create(:title => "New Dress", :description =>"Get Fred to buy me a new dress")
b3.goals << g3
ethel.buckets << b3
ethel.save
