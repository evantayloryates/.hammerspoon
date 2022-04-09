local MODULE_ROOT = ''
local IMPORTS = {
	'config',
	'utils',
	'ProfileLayouts',
	'HotWindows',
}
local EXCLUDES = {
	'AppleScripts',
}

for _,item in pairs(IMPORTS) do
	require(MODULE_ROOT .. item)
end

-- Function to throw warnings if you are missing any local file imports
checkImports(MODULE_ROOT:gsub('%.','/'), IMPORTS, EXCLUDES)