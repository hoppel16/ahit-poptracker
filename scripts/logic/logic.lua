---[[
function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
      return count > 0
    else
      return count >= amount
    end
end

-- basic functions
function sprint()
    return has("sprint")
end

function brewer()
  return has("brewer")
end

function ice()
  return has("ice")
end

function dweller()
  return has("dweller")
end

function timestop()
  return has("timestop")
end

function hookshot()
  return has("hookshot")
end

function scooter()
  return has("scooter")
end