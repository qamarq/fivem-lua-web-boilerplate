if not lib then
  return print('ox_inventory requires the ox_lib resource, refer to the documentation.')
end

local function addDeferral(err)
  err = err:gsub("%^%d", "")

  AddEventHandler('playerConnecting', function(_, _, deferrals)
      deferrals.defer()
      deferrals.done(err)
  end)
end

-- Do not modify this file at all. This isn't a "config" file. You want to change
-- resource settings? Use convars like you were told in the documentation.
-- You did read the docs, right? Probably not, if you're here.
-- https://overextended.dev/ox_inventory#config

shared = {
  resource = GetCurrentResourceName(),
  target = true,
}

function shared.print(...) print(string.strjoin(' ', ...)) end

function shared.info(...) lib.print.info(string.strjoin(' ', ...)) end

---Throws a formatted type error.
---```lua
---error("expected %s to have type '%s' (received %s)")
---```
---@param variable string
---@param expected string
---@param received string
function TypeError(variable, expected, received)
    error(("expected %s to have type '%s' (received %s)"):format(variable, expected, received))
end

-- People like ignoring errors for some reason
local function spamError(err)
  shared.ready = false

  CreateThread(function()
      while true do
          Wait(10000)
          CreateThread(function()
              error(err, 0)
          end)
      end
  end)

  addDeferral(err)
  error(err, 0)
end

if not lib then
  return spamError('ox_inventory requires the ox_lib resource, refer to the documentation.')
end

local success, msg = lib.checkDependency('oxmysql', '2.7.3')

if success then
  success, msg = lib.checkDependency('ox_lib', '3.13.0')
end

if not success then
  return spamError(msg)
end

if not LoadResourceFile(shared.resource, 'web/build/index.html') then
  return spamError(
      'UI has not been built, refer to the documentation or download a release build.\n	^3https://overextended.dev/ox_inventory^0')
end

-- No we're not going to support qtarget any longer.
if shared.target and GetResourceState('ox_target') ~= 'started' then
  shared.target = false
  warn('ox_target is not loaded - it should start before ox_inventory')
end

if lib.context == 'server' then
  shared.ready = false
  return require 'server'
end

require 'client'