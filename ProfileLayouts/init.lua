-- ON SHUTDOWN --

-- Minimize any fullscreen windows
-- Remove all Desktop Spaces (should leave 1 per screen)
  -- NOTE: This will move all active windows to the base desktop screens


function todo()
	-- Target your window to move
	HSWindow = gwid(555319)

	-- Make sure target window is in front and focused
	HSWindow:focus()

	-- Get window's "zoom" button center point
	btnRect = hs.geometry.new(HSWindow:zoomButtonRect())
	btnCenter = btnRect.center
	clickTarget = btnCenter + {10,0}

	down_evt = hs.eventtap.event.newMouseEvent(1, clickTarget)
	down_evt:post()

	hs.osascript.applescriptFromFile(APPLESCRIPTS_DIR .. 'switchSpace/primary/3.scpt')

	up_evt = hs.eventtap.event.newMouseEvent(2, clickTarget)
	up_evt:post()
end

-- hs.osascript.applescriptFromFile("/Users/etay/.hammerspoon/Applescripts/switchSpaceLeft.scpt")



-- -- Send mouse down event
-- -- hs.mouse.setRelativePosition(hs.geometry.new({160,110}))
-- print('hi')
-- hs.eventtap.event.newMouseEvent(1, hs.geometry.new({160,110}))
-- hs.eventtap.leftClick(point[, delay])
-- hs.mouse.setRelativePosition(hs.geometry.new({200,110}))
-- hs.eventtap.event.newMouseEvent(2, hs.geometry.new({200,110}))
-- print('done')