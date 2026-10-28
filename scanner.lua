local addonName, addonTable = ...
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local addon = addonTable.addon

local scanner = addon:NewModule("Scanner")

function scanner:GetStatus()
    return L["Boon scanning is not implemented yet."]
end

function scanner:Scan()
    -- TODO: Discover boon candidates and their positions in the current Delve.
    return nil, L["Boon scanning is not implemented yet."]
end
