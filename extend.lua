term.clear()
term.setCursorPos(1,1)
term.setBackgroundColor(colors.black)

print'How many minutes would you like to add?'
mint=read()
mint=tonumber(mint)
getType=type(mint)
if getType=="number" then
if mint<=1440 and mint>0 then
secs=mint*60
os.queueEvent("extendme", secs)
print('Extended logout timer '..mint..' minute(s).')
end
if mint>1440 or mint<1 then
print'Invalid choice!'
end
end
if getType=="nil" or getType=="string" then
print'Numbers only please!'
end
sleep(1)
