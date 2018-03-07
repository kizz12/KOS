timetor=5
while timetor > 0 do
term.clear()
term.setCursorPos(1,1)
timetor=timetor-1
print('Logging out in '..timetor..' seconds.')
sleep(.95)
end
os.reboot()
