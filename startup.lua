osEvent = os.pullEvent
os.pullEvent = os.pullEventRaw


	while access~=1 do
	term.clear()
	term.setCursorPos(1,1)
	term.setTextColor(colors.orange)
	print'KOS 1.1'
	term.setTextColor(colors.white)
	if not fs.exists("users") then
		print'No users!'
		print'Create default user now.'
		user=3
		shell.run("newuser")
		return
	end
	print'Enter User:'
	usern=read()
	print'Enter Password:'
	pass=read("*")
	access=0
		--sleep(1)
		term.clear()
		term.setCursorPos(1,1)
		
		
		
		

	if fs.exists("users") then
		local h = fs.open("users", "r")
		getUsers=h.readAll()
		h.close()
		unSearch=string.find(getUsers,usern..":")
		if unSearch==nil then
			print'Could not find user!'
			sleep(2)
		end
		if unSearch~=nil then
			fullSearch=string.find(getUsers,usern..":"..pass..":")
			if fullSearch==nil then
				print'Password incorrect!'
				sleep(2)
			end
			if fullSearch~=nil then
			
			f1Search=string.find(getUsers,usern..":"..pass..":0")
			f2Search=string.find(getUsers,usern..":"..pass..":1")
			if f1Search==nil and f2Search==nil then
			print'Failed to get auth!'
			end
			if f1Search~=nil and f2Search==nil then
			access=1
			shell.openTab("guest")
			print'KOS Loading...'
			sleep(1)
			term.clear()
			term.setCursorPos(1,1)
			term.setTextColor(colors.orange)			
			print('Welcome, '..usern..', to Kizz OS!')
			term.setTextColor(colors.blue)
			print'Commands: '
			term.setTextColor(colors.white)
			print'logout - Logs user out. '
			print'extend - Extends logout timer by x min.'
			print'help - Shows more commands'
			user=0
			end
			if f1Search==nil and f2Search~=nil then
			access=1
			shell.openTab("master")
			print'KOS Loading...'
			sleep(1)
			term.clear()
			term.setCursorPos(1,1)
			term.setTextColor(colors.orange)		
			print('Welcome, '..usern..', to Kizz OS!')
			term.setTextColor(colors.blue)
			print'Commands: '
			term.setTextColor(colors.white)
			print'logout - Logs user out. '
			print'extend - Extends logout timer by x min.'
			print'help - Shows more commands'
			user=1
			end
			end
		end
	end	
end

	
	
	
	
	
	function logme()
		userName=usern
		
		
		if not fs.exists("log") then
		local h = fs.open("log", "a")
		h.write(" ")
		h.close()
		end
		
		if fs.exists("log") then
			local h = fs.open("log", "r")
			loglen=h.readAll()
			--print(loglen)
			if string.len(loglen)>1000000 then
			h.close()
			fs.delete("log")
			end
			h.close()
			local h = fs.open("log", "a")
			h.write(userName.." - Day: "..os.day().." | Time: "..os.time()..". \n")
			h.close()
		end
	
	
	end
	
	
	logme()
--os.pullEvent=osEvent
