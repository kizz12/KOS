term.setCursorPos(1,1)
term.clear()
term.setBackgroundColor(colors.black)
print'Commands:'
print'logout - Logs user out. '
print'extend - Extends logout timer by x min.'
print'help - Shows more commands'
if user==1 then
--print'Door - Opens interior security doors.'
print'newuser - Opens the new user creator.'
end
if user==0 then
print''
end
print'Press any key to continue!'
x=read()
if x~=nil then
return
end
