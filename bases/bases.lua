


-- ---------- Inits --------------

--gs.MountFileDriver(gs.StdFileDriver())
--gs.LoadPlugins(gs.get_default_plugins_path())

-- ---------- Display object and Output screen:

renderer = gs.EglRenderer()
renderer:Open(640,480)

------------ Get devices:

print ("Installed devices:")
devices = gs.GetInputSystem():GetDevices()
for k,device in pairs(devices) do
    print("Id: " .. device:GetId() .. " - Name : " .. device:GetName())
end
	
keyboard_device = gs.GetInputSystem():GetDevice("keyboard")
mouse_device = gs.GetInputSystem():GetDevice("mouse")



------------ Main loop:

while renderer:GetDefaultOutputWindow() do

    gs.GetInputSystem():Update()

    --- Keyboard controls:

    if (keyboard_device:WasPressed(gs.InputDevice.KeyEscape)) then
        break
    
	elseif (keyboard_device:WasPressed(gs.InputDevice.KeyA)) then
        print("A")
	
    elseif (keyboard_device:IsDown(gs.InputDevice.KeyZ)) then
        print ("Z")
	
    elseif (keyboard_device:WasDown(gs.InputDevice.KeyE)) then
        print("E")
	
	end

     --- Keyboard key code:
    for key =0, gs.InputDevice.KeyLast do
            if keyboard_device:WasPressed(key) then
                print(("Key code: %d"):format(key))
			end
	end

    --- Mouse controls:

    if (mouse_device:WasButtonPressed(gs.InputDevice.Button0)) then
        print (("Mouse position: %d,%d"):format (mouse_device:GetValue(gs.InputDevice.InputAxisX),mouse_device:GetValue(gs.InputDevice.InputAxisY)))
	end
		
    if (mouse_device:IsButtonDown(gs.InputDevice.Button1)) then
        print (("Mouse position: %d,%d"):format (mouse_device:GetValue(gs.InputDevice.InputAxisX),mouse_device:GetValue(gs.InputDevice.InputAxisY)))
	end
		
    if (mouse_device:WasButtonReleased(gs.InputDevice.Button2)) then
        print (("mouse position: %d,%d"):format (mouse_device:GetValue(gs.InputDevice.InputAxisX),mouse_device:GetValue(gs.InputDevice.InputAxisY)))
	end
		
    --- End of frame:

    renderer:DrawFrame()
    renderer:ShowFrame()
    renderer:UpdateOutputWindow()
end
