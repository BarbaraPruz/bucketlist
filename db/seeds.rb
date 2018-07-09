lucy = User.create(:username => "Lucy Ricardo", :email => "lucy@domain.com", :password => "test")
b1 = Bucket.create(:name => "Lifetime", :description => "What I want to do in my life!")
b2 = Bucket.create(:name => "Family", :description => "What I want to do with my family")
lucy.buckets << b1
lucy.buckets << b2
lucy.save
ethel = User.create(:username => "Ethel Mertz", :email => "ethel@domain.com", :password => "test")
b3 = Bucket.create(:name => "My Goals")
ethel.buckets << b3
ethel.save
