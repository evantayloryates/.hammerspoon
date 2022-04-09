function hs_window_pp(HSWindow)
	
	-- Static Variables --
	--   hs.window.animationDuration
	--   hs.window.setFrameCorrectness

	local out_string = concat('\n', string.rep('*', 50), '\n\n')
	
	-- Instance Variables --
	out_string = concat(out_string, 'ID:            ', HSWindow:id(), '\n' )	
	out_string = concat(out_string, 'Title:         ', HSWindow:title(), '\n' )
	out_string = concat(out_string, 'Application:   ', HSWindow:application(), '\n' )	
	out_string = concat(out_string, 'Screen:        ', HSWindow:screen(), '\n' )
	
	out_string = concat(out_string, 'Standard:      ', HSWindow:isStandard(), '\n' )
	
	out_string = concat(out_string, 'Fullscreen:    ', HSWindow:isFullScreen(), '\n' )
	out_string = concat(out_string, 'Can Maximize:  ', HSWindow:isMaximizable(), '\n' )
	out_string = concat(out_string, 'Minimized:     ', HSWindow:isMinimized(), '\n' )
	out_string = concat(out_string, 'Visible:       ', HSWindow:isVisible(), '\n' )
	
	out_string = concat(out_string, 'Size:          ', HSWindow:size(), '\n' )
	out_string = concat(out_string, 'Frame:         ', HSWindow:frame(), '\n' )	
	out_string = concat(out_string, 'Top Left:      ', HSWindow:topLeft(), '\n' )
	
	out_string = concat(out_string, 'Role:          ', HSWindow:role(), '\n' )
	out_string = concat(out_string, 'Role (sub):    ', HSWindow:subrole(), '\n' )
	out_string = concat(out_string, 'Tab Count:     ', HSWindow:tabCount(), '\n' )
	

	out_string = concat(out_string, 'Windows North: ', #HSWindow:windowsToNorth(), '\n' )
	out_string = concat(out_string, 'Windows South: ', #HSWindow:windowsToSouth(), '\n' )
	out_string = concat(out_string, 'Windows East:  ', #HSWindow:windowsToEast(), '\n' )
	out_string = concat(out_string, 'Windows West:  ', #HSWindow:windowsToWest(), '\n' )
	
	out_string = concat(out_string, '\n', string.rep('*', 50), '\n')
	print(out_string)
end

function hs_window_ppa(HSWindowArray)
	for _, HSWindow in pairs(HSWindowArray) do
		pp(HSWindow)
	end
end

function getWindowOrderIndex(HSWindow)
	-- hs.window.orderedWindows
end