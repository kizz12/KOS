 --local osEvent=os.pullEvent
--os.pullEvent=os.pullEventRaw
function protect()
	local combine = fs.combine
	local oldFs = fs.open
	--print'OS Protect active!'
	fs.open = function(path,...)
		if combine("/",path) == "rom/programs/edit" then 
			--print'Failed to call edit!'
			return
		end
		if combine("/",path) == "rom/programs/delete" then
			--print'Failed to call delete!'
			return
		end
		if combine("/",path) ~= "rom/programs/delete" then
			return oldFs(path,...)
		end
	end
end


function logout()
	timetor=300
	while timetor > 0 do
		term.clear()
		term.setCursorPos(1,1)
		timetor=timetor-1
		print('Welcome OP. System Online. Restarting in '..timetor..' seconds.')
		sleep(.95)
	end
	os.reboot()
end

function listener()
	while true do		
		eventExtend,timer = os.pullEvent("extendme")
		if eventExtend == "extendme" and timer > 0 then
			print("Extending time!")
			timetor=timetor+timer
		end
	end
end



parallel.waitForAll(listener,logout,protect)
os.pullEvent=osEvent
