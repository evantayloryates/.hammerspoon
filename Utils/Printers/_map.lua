printMap = { 
	hs_window = hs_window_pp,
	hs_application = hs_application_pp,
	hs_eventtap_event = hs_event_pp,
}

function pp(obj)
	printMap[replaceAll(obj.__type, '%.', '_')](obj)
end

