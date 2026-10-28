local addonName, addonTable = ...

local AceAddon = LibStub("AceAddon-3.0")
local AceDB = LibStub("AceDB-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local addon = AceAddon:NewAddon(addonName, "AceConsole-3.0", "AceEvent-3.0")
addonTable.addon = addon

local defaults = {
    profile = {
        showBoonPins = true,
        minimap = {
            hide = false,
        },
    },
}

function addon:OnInitialize()
    self.db = AceDB:New("BearsBoonFinderDB", defaults, true)

    self:RegisterChatCommand("boonfinder", "OpenFinder")
    self:RegisterChatCommand("bbf", "OpenFinder")

    self:Print(L["Loaded. Type /boonfinder to open the finder."])
end

function addon:OnEnable()
    self:CreateMinimapButton()
end

function addon:OpenFinder()
    if not self.finderFrame then
        self:CreateFinderFrame()
    end

    self:RefreshFinder()
    self.finderFrame:Show()
end

function addon:RefreshFinder()
    local scanner = self:GetModule("Scanner")
    if self.statusLabel then
        self.statusLabel:SetText(scanner:GetStatus())
        self.resultsLabel:SetText(scanner:GetSummary())
        self.pinCheckbox:SetValue(self.db.profile.showBoonPins)
    end
end

function addon:ScanCurrentDelve()
    local _, message = self:GetModule("Scanner"):Scan()
    if self.resultsLabel then
        self.resultsLabel:SetText(message or L["No potential Mislaid Curiosity locations found."])
    end
end
