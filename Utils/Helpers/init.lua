local MODULE_ROOT = 'Utils.Helpers.'
local IMPORTS = {
	'meta',
	'misc',
	'aliases',
	'arrays',
	'iterators',
	'strings',
}
local EXCLUDES = {}

for _,item in pairs(IMPORTS) do
	require(MODULE_ROOT .. item)
end

-- Function to throw warnings if you are missing any local file imports
checkImports(MODULE_ROOT:gsub('%.','/'), IMPORTS, EXCLUDES)
