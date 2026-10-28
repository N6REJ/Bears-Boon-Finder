local addonName, addonTable = ...
local AceGUI = LibStub("AceGUI-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local addon = addonTable.addon

function addon:CreateFinderFrame()
    local frame = AceGUI:Create("Frame")
    frame:SetTitle(L["Bears Boon Finder"])
    frame:SetLayout("Flow")
    frame:SetWidth(430)
    frame:SetHeight(220)
    frame:EnableResize(false)

    local purposeLabel = AceGUI:Create("Label")
    purposeLabel:SetText(L["Find boon locations within a Delve."])
    purposeLabel:SetFullWidth(true)
    frame:AddChild(purposeLabel)

    local statusLabel = AceGUI:Create("Label")
    statusLabel:SetFullWidth(true)
    frame:AddChild(statusLabel)

    local scanButton = AceGUI:Create("Button")
    scanButton:SetText(L["Scan Delve"])
    scanButton:SetWidth(130)
    scanButton:SetCallback("OnClick", function()
        self:ScanCurrentDelve()
    end)
    frame:AddChild(scanButton)

    local resultsLabel = AceGUI:Create("Label")
    resultsLabel:SetText(L["No scan has been run yet."])
    resultsLabel:SetFullWidth(true)
    frame:AddChild(resultsLabel)

    frame:SetCallback("OnClose", function(widget)
        self.finderFrame = nil
        self.statusLabel = nil
        self.resultsLabel = nil
        AceGUI:Release(widget)
    end)

    self.finderFrame = frame
    self.statusLabel = statusLabel
    self.resultsLabel = resultsLabel
end
