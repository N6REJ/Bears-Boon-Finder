local addonName, addonTable = ...

local AceAddon = LibStub("AceAddon-3.0")
local AceDB = LibStub("AceDB-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local addon = AceAddon:NewAddon(addonName, "AceConsole-3.0", "AceEvent-3.0")
addonTable.addon = addon

local defaults = {
    profile = {},
}

function addon:OnInitialize()
    self.db = AceDB:New("BearsBoonFinderDB", defaults, true)

    self:RegisterChatCommand("boonfinder", "OpenFinder")
    self:RegisterChatCommand("bbf", "OpenFinder")

    self:RegisterEvent("PLAYER_ENTERING_WORLD", "RefreshDelveStatus")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "RefreshDelveStatus")
    self:RegisterEvent("ACTIVE_DELVE_DATA_UPDATE", "RefreshDelveStatus")
    self:RegisterEvent("WALK_IN_DATA_UPDATE", "RefreshDelveStatus")

    self:Print(L["Loaded. Type /boonfinder to open the finder."])
end

function addon:OpenFinder()
    if not self.finderFrame then
        self:CreateFinderFrame()
    end

    self:RefreshDelveStatus()
    self.finderFrame:Show()
end

function addon:RefreshDelveStatus()
    if self.statusLabel then
        self.statusLabel:SetText(self:GetModule("Scanner"):GetStatus())
    end
end

function addon:ScanCurrentDelve()
    local _, message = self:GetModule("Scanner"):Scan()
    self.resultsLabel:SetText(message or L["Boon locations will appear here when discovery is implemented."])
end
