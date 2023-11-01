require("scripts/objects/chapter_info")

function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count >= amount
  end
end

function canAccessChapter(chapter_to_access)
  for key, act in pairs(chapter_act_info) do
    if chapter_to_access and act.chapter == tonumber(chapter_to_access) and act.isAccessible then
      print("Access found at " .. key)
      return true
    end
  end

  return false
end

function canAccessAct(act_to_access)
  for key, act in pairs(chapter_act_info) do
    if act_to_access and act.act_name == act_to_access and act.isAccessible then
      print("Access found at " .. key)
      return true
    end
  end

  return false
end