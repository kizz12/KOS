local tArgs = { ... }
if #tArgs < 1 then
	print( "Usage: rm <path>" )
	return
end



local sPath = shell.resolve( tArgs[1] )
local tFiles = fs.find( sPath )
if #tFiles > 0 then
    for n,sFile in ipairs( tFiles ) do
        if sFile=="startup" or sFile=="users" or sFile=="newuser" or sFile=="master" or sFile=="guest" or sFile=="door" or sFile=="edit" or sFile=="extend" or sFile=="help" or sFile=="log" or sFile=="logout" or sFile=="delete" then
		print"Can't delete this file!"
		return
		end
		
		fs.delete( sFile )
    end
else
    printError( "No matching files" )
end
