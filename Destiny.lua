local frame = CreateFrame("Frame",  nil, UIParent);

function frame:OnEvent(event)
	if UnitGroupRolesAssigned("player") == "NONE" or event == "ACTIVE_TALENT_GROUP_CHANGED" then
		local spec = GetSpecialization()
		if spec and spec > 0 then
			UnitSetRole(UnitName("player"), GetSpecializationRole(spec))
		else
			UnitSetRole(UnitName("player"), "NONE")
		end
	end
	
	if event == "ROLE_POLL_BEGIN" then
		StaticPopupSpecial_Hide(RolePollPopup)
	end
end

frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
frame:RegisterEvent("GROUP_JOINED")
frame:RegisterEvent("ROLE_POLL_BEGIN")

frame:SetScript("OnEvent", frame.OnEvent)
