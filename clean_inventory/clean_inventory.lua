
--[[
	We setup the global table for our mod, along with some path variables, and a data table.
	We cache the ModPath directory, so that when our hooks are called, we aren't using the ModPath from a
		different mod.
]]
_G.clean_inventory = _G.clean_inventory or {}
clean_inventory._path = ModPath
clean_inventory._data = {} 

--[[
	Load our localization keys for our menu, and menu items.
]]
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_clean_inventory", function( loc )
	loc:load_localization_file( clean_inventory._path .. "en.txt")
end)

--[[
	Setup our menu callbacks, load our saved data, and build the menu from our json file.
]]
Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_clean_inventory", function( menu_manager )

	--[[
		Setup our callbacks as defined in our item callback keys, and perform our logic on the data retrieved.
	]]


	MenuCallbackHandler.callback_clean_button = function(self, item)

		Global.blackmarket_manager.new_drops = {}

	end

	--[[
		Load our menu json file and pass it to our MenuHelper so that it can build our in-game menu for us.
		We pass our parent mod table as the second argument so that any keybind functions can be found and called
			as necessary.
		We also pass our data table as the third argument so that our saved values can be loaded from it.
	]]
	MenuHelper:LoadFromJsonFile( clean_inventory._path .. "clean_inventory_menu.txt", clean_inventory, clean_inventory._data )

end )
