
task :notifier => :environment do
	@users = User.all
	old_users = []
	new_users = []
	notify = []
	# A Timer variabl has been set. Now we know when we last ran notify.
	z = Timer.find(1)
	past_flag = z.updated_at
	
	@users.each do |i|
		if i.created_at > past_flag
			new_users.push(i)
		else
			old_users.push(i)
		end
	end


	#query api is still obtuse. Workaround: 
	#instantiate a friends list, then check every old user against newuser
	new_users.each do |z|
		friends_array = []
		z.facebook.get_connections("me", "friends").each do |i|
			friends_array.push(i.id)
		old_users.each do |q|
			if friends_array.include? q.id
				notify.push(q)
				notify.push(z)
			end
		end
	end
	
	puts notify[]

	#update the notify timer
	z.value += 1
	z.save!
	puts z.updated_at
	end
end
