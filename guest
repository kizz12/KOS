--local osEvent=os.pullEvent
--os.pullEvent=os.pullEventRaw

os.pullEvent = function(filter)
        while true do
                local myEvent = {os.pullEventRaw(filter)}
                if myEvent[1] ~= "terminate" then return unpack(myEvent) end
        end
end

function logout()
	timetor=300
	while timetor > 0 do
		term.clear()
		term.setCursorPos(1,1)
		timetor=timetor-1
		print('Welcome Guest. System Online. Restarting in '..timetor..' seconds.')
		print('System set to restrictive access due to security level.')
		sleep(.95)
	end
	os.reboot()
end

function listener()
	while true do		
		event,timer = os.pullEvent("extendme")
		if event == "extendme" and timer > 0 then
			print("Extending time!")
			timetor=timetor+timer
		end
	end
end



parallel.waitForAll(listener,logout)
os.pullEvent=osEvent