--button functions
----------------------------------
function lgt() --logout function
	t:toggleButton("Logout")
	sleep(.2)
	t:toggleButton("Logout")
	term.setBackgroundColor(colors.black)
	term.clear()
	term.setCursorPos(1,1)
	shell.run("logout")

end

function pgm()
	t:toggleButton("Programs")
	sleep(.2)
	t:toggleButton("Programs")
	term.setBackgroundColor(colors.orange)
	term.setTextColor(colors.blue)
	term.clear()
	term.setCursorPos(1,1)
	shell.run("programs")
	print'Please enter the program you wish to run, or exit to return to the GUI.'
	getPgm=read()
	if getPgm~="exit" then
		shell.run(getPgm)
	end
end

function hlp()
	t:toggleButton("Help")
	sleep(.2)
	t:toggleButton("Help")
	term.setCursorPos(1,1)
	term.clear()
	term.setBackgroundColor(colors.black)
	shell.run("help")
end

function tm()
	t:toggleButton("Terminal Mode")
	sleep(.2)
	t:toggleButton("Terminal Mode")
	term.setBackgroundColor(colors.black)
	term.clear()
	term.setCursorPos(1,1)
	print("Switching to Terminal mode!")
	sleep(1)
	setBreak=true
end

function ext()
	t:toggleButton("Extend")
	sleep(.2)
	t:toggleButton("Extend")
	term.setBackgroundColor(colors.black)
	term.clear()
	term.setCursorPos(1,1)
	shell.run("extend")
end

function nu()
	t:toggleButton("New User")
	sleep(.2)
	t:toggleButton("New User")
	term.setBackgroundColor(colors.black)
	term.clear()
	term.setCursorPos(1,1)
	shell.run("newuser")
end

function ru()
	t:toggleButton("Remove User")
	sleep(.2)
	t:toggleButton("Remove User")
	term.setBackgroundColor(colors.black)
	term.clear()
	term.setCursorPos(1,1)
	--shell.run("remove")
	print("Coming soon!")
	sleep(1)
end

function nfile()
	t:toggleButton("New File")
	sleep(.2)
	t:toggleButton("New File")
	term.setBackgroundColor(colors.black)
	term.clear()
	term.setCursorPos(1,1)
	print'What would you like to name your file?'
	fName=read()
	shell.run("edit "..fName)
end

function doNothing()
return
end
------------------------------------------


--prevent loop break when restarting GUI
setBreak=false
--load api
os.loadAPI("touchpoint")


------------------------------------------
--New screen
------------------------------------------
t = touchpoint.new()


------------------------------------------
--Buttom parameters
------------------------------------------
t:add("Programs", pgm, 2, 2, 12, 6, colors.red, colors.green)
t:add("Logout", lgt, 40, 14, 51, 18, colors.red, colors.green)
t:add("Help", hlp, 14, 2, 19, 6, colors.red, colors.green)
t:add("Terminal Mode", tm, 2, 8, 19, 12, colors.red, colors.green)
t:add("Extend", ext, 2, 14, 19, 18, colors.red, colors.green)
if user==1 then
t:add("New User", nu, 21, 8, 38, 12, colors.red, colors.orange)
t:add("Remove User", ru, 21, 14, 38, 18, colors.red, colors.orange)
end
t:add("New File", nfile, 21, 2, 38, 6, colors.red, colors.blue)
t:add("KOS", doNothing, 40, 2, 50, 7, colors.brown, colors.blue)
getTime=os.day()
t:add("Day:"..getTime, doNothing, 40, 8, 50, 12, colors.brown, colors.blue)
------------------------------------------
--actually make the buttons
------------------------------------------
t:draw()


------------------------------------------
--Make the buttons fancy
------------------------------------------
t:toggleButton("Programs")
t:toggleButton("Logout")
t:toggleButton("Help")
t:toggleButton("Terminal Mode")
t:toggleButton("Extend")
if user==1 then
t:toggleButton("New User")
t:toggleButton("Remove User")
end
t:toggleButton("New File")


------------------------------------------
--Listen for buttons to be clicked
------------------------------------------

	while true do
		t:run()
		bp=true
		if setBreak==true then
			break
		end
	end



term.setBackgroundColor(colors.black)
term.clear()
term.setCursorPos(1,1)
