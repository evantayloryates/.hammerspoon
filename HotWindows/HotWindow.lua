WIDTH_RATIO = .9
HEIGHT_RATIO = .9

HotWindow = {
   targetFrame = nil, 
   activeWindow = nil, 
   targetScreen = nil
}

function HotWindow:new (o, screen, frame)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   self.targetScreen = screen or hs.screen.primaryScreen()
   self.targetFrame = frame or getTargetFrame(self.targetScreen)
   self.activeWindow = nil
   self.windowFilter = hs.window.filter.new({default = {focused = true}})
   -- self.windowFilter = self.windowFilter:rejectApp("Hammerspoon")
   return o
end

function HotWindow:setActiveWindow(window)
   
   if not window then
      hs.alert("No active window")
   end

   print("\nWINDOW: " .. window:title() .. "")

   sameWindow = self.activeWindow == window

   if self.activeWindow then
      sameApp = (self.activeWindow and self.activeWindow:application() == window:application())
   end

   print("sameWindow", sameWindow)
   print("sameApp", sameApp)

   -- Check if window is on correct screen
   windowIsOnCorrectScreen = (window:screen() == self.targetScreen)

   -- Check if window is focused (scope: app)
   windowIsAppFocused = (window:application():focusedWindow() == window)
   
   -- Check if window is focused (scope: system)
   windowIsSystemFocused = ((self.windowFilter:getWindows() or {})[1] == window)
   
   -- Check that window is sized correctly
   windowHasCorrectFrame = (window:frame() == self.targetFrame)
   
   -- Check if window is minimized
   windowIsMinimized = false
   if window:isMinimized() then windowIsMinimized = true end 

   s = "\n"
   s = s .. "    Correct Screen      : " .. tostring(windowIsOnCorrectScreen) .. "\n"
   s = s .. "    App Focused         : " .. tostring(windowIsAppFocused) .. "\n"
   s = s .. "    System Focused      : " .. tostring(windowIsSystemFocused) .. "\n"
   s = s .. "    Correct Size        : " .. tostring(windowHasCorrectFrame) .. "\n"
   s = s .. "    Window is Minimized : " .. tostring(windowIsMinimized) .. "\n"

   print(s)

   -- Make sure screen is set to primary screen
   if not windowIsOnCorrectScreen then window:moveToScreen(self.targetScreen, true, nil, 0) end
   if not windowHasCorrectFrame then window:setFrame(self.targetFrame, 0) end
   if not windowIsSystemFocused then
      print("Focusing: ", window:title())
      window:focus()
      hs.timer.doUntil(
         function() return ((self.windowFilter:getWindows() or {})[1] == window) end,
         function() 
            print("Focusing Again: ", window:title())
            window:focus() 
         end,
         .1
      )
   end

   -- If window is minimized, we need to trigger a hide
   if windowIsMinimized then 
      hs.timer.doAfter(.1, function()
         window:unminimize()
      end)
   end

   -- Hide old active window if it's not part of the same app
   if self.activeWindow and not sameApp then
      self.activeWindow:application():hide()
   end

   -- Set new activeWindow
   self.activeWindow = window
   
end

function getTargetFrame(screen)
   sf = screen:frame()
   tw = sf.w * WIDTH_RATIO
   th = sf.h * HEIGHT_RATIO

   xOff = (sf.w/2)-(tw/2);
   yOff = (sf.h/2)-(th/2); 

   tx = sf.x + xOff
   ty = sf.y + yOff
   return hs.geometry.new(tx, ty, tw, th)
end