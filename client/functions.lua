--- Toggles the NUI frame visibility
---@param shouldShow boolean Whether the NUI frame should be shown
function ToggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', shouldShow)
end