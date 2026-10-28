local addonName, addonTable = ...
local AceGUI = LibStub("AceGUI-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local addon = addonTable.addon
local BOON_ICON = "Interface\\Icons\\INV_Misc_Spyglass_03"
local LibDBIcon = LibStub("LibDBIcon-1.0")

local minimapDataObject = LibStub("LibDataBroker-1.1"):NewDataObject(addonName, {
    type = "launcher",
    text = L["Bears Boon Finder"],
    icon = BOON_ICON,
    OnClick = function(_, button)
        if button == "LeftButton" then
            addon:OpenFinder()
            addon:ScanCurrentDelve()
        end
    end,
    OnTooltipShow = function(tooltip)
        local scanner = addon:GetModule("Scanner")
        tooltip:AddLine(L["Bears Boon Finder"], 1, 0.82, 0)
        tooltip:AddLine(L["Scan Delve"], 1, 1, 1)
        tooltip:AddLine(L["Click to scan for Mislaid Curiosities."], 1, 1, 1, true)
        tooltip:AddLine(scanner:GetStatus(), 0.8, 0.8, 0.8, true)
        tooltip:AddLine(scanner:GetSummary(), 0.8, 0.8, 0.8, true)
    end,
})

function addon:CreateMinimapButton()
    if self.minimapIconRegistered then
        return
    end

    LibDBIcon:Register(addonName, minimapDataObject, self.db.profile.minimap)
    self.minimapIconRegistered = true
end

function addon:CreateFinderFrame()
    local frame = AceGUI:Create("Frame")
    frame:SetTitle(L["Bears Boon Finder"])
    frame:SetLayout("Flow")
    frame:SetWidth(430)
    frame:SetHeight(220)
    frame:EnableResize(false)

    local purposeLabel = AceGUI:Create("Label")
    purposeLabel:SetText(L["Find Mislaid Curiosities in a Delve or Labyrinth."])
    purposeLabel:SetFullWidth(true)
    frame:AddChild(purposeLabel)

    local statusLabel = AceGUI:Create("Label")
    statusLabel:SetFullWidth(true)
    frame:AddChild(statusLabel)

    local pinCheckbox = AceGUI:Create("CheckBox")
    pinCheckbox:SetLabel(L["Show Mislaid Curiosity treasure chest pins"])
    pinCheckbox:SetValue(self.db.profile.showBoonPins)
    pinCheckbox:SetFullWidth(true)
    pinCheckbox:SetCallback("OnValueChanged", function(_, _, value)
        self.db.profile.showBoonPins = value
        self:GetModule("Scanner"):UpdateActivity()
    end)
    frame:AddChild(pinCheckbox)

    local scanButton = AceGUI:Create("Button")
    scanButton:SetText(L["Scan Delve"])
    scanButton:SetWidth(130)
    scanButton:SetCallback("OnClick", function()
        self:ScanCurrentDelve()
    end)
    frame:AddChild(scanButton)

    local resultsLabel = AceGUI:Create("Label")
    resultsLabel:SetFullWidth(true)
    frame:AddChild(resultsLabel)

    frame:SetCallback("OnClose", function(widget)
        self.finderFrame = nil
        self.statusLabel = nil
        self.resultsLabel = nil
        self.pinCheckbox = nil
        AceGUI:Release(widget)
    end)

    self.finderFrame = frame
    self.statusLabel = statusLabel
    self.resultsLabel = resultsLabel
    self.pinCheckbox = pinCheckbox
end
