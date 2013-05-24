Order.transaction do
	(1..100).each do |i|
		Order.create(:name => "Customer #{i}",:address => "House No. #{i} Gurgaon", :email => "myname_#{i}@gmail.com",:pay_type => "Check")
	end
end