print'How many minutes would you like to add?'
mint=io.read()
mint=tonumber(mint)

if mint<=1440 and mint>0 then
secs=mint*60
os.queueEvent("extendme", secs)
print('Extended logout timer '..mint..' minute(s).')
end
if mint>1440 or mint<1 then
print'Invalid choice!'
end