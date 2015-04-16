if user==0 then
print"Sorry, you aren't allowed to create users!"
end
if user==1 then
	print'Welcome to the user creator!'
	print'Please enter the desired username:'
	uncrt=read()
	print('Please enter the desired password for '..uncrt..".")
	unpass=read()
	local acclvl=-1
	while acclvl~=0 and acclvl~=1 do
		print'Please set access level: 0 or 1.'
		acclvl=read()
		acclvl=tonumber(acclvl)
		if acclvl<0 or acclvl>1 then
		print'Must be 0 or 1!'
		end
	end

	
	if not fs.exists("users") then
		local h = fs.open("users", "a")
		--h.write("")
		h.close()
	end
	if fs.exists("users") then
		local h = fs.open("users", "r")
		allUsers=h.readAll()
		h.close()
		unSearch=string.find(allUsers,uncrt..":")
		if unSearch~=nil then
		print'Username already exists!'
		return
		end
		if unSearch==nil then
			local h = fs.open("users", "a")
			h.write(uncrt..":"..unpass..":"..acclvl.."\n")
			h.close()
		end
	end
		print('User: '..uncrt..' has been created with access level '..acclvl..'.')
end
if user==3 then
	print'Welcome to the user creator!'
	print'Please enter the desired username:'
	uncrt=read()
	print('Please enter the desired password for '..uncrt..".")
	unpass=read()
	local acclvl=-1
	while acclvl~=0 and acclvl~=1 do
		acclvl=1
		if acclvl<0 or acclvl>1 then
		print'Must be 0 or 1!'
		end
	end

	
	if not fs.exists("users") then
		local h = fs.open("users", "a")
		--h.write("")
		h.close()
	end
	if fs.exists("users") then
		local h = fs.open("users", "r")
		allUsers=h.readAll()
		h.close()
		unSearch=string.find(allUsers,uncrt..":")
		if unSearch~=nil then
		print'Username already exists!'
		return
		end
		if unSearch==nil then
			local h = fs.open("users", "a")
			h.write(uncrt..":"..unpass..":"..acclvl.."\n")
			h.close()
		end
	end
		print('User: '..uncrt..' has been created with access level '..acclvl..'.')
		sleep(2)
		os.reboot()
end