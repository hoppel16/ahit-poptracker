-- Set up struct for act randomization
-- This is super cool and I'm proud

local Act = {
    chapter = -1,
    act_requirements = {},
    act_name = "",
    isAccessible = false
}

Act.__index = Act

function Act.new(chapter, act_requirements, act_name, isAccessible)
    local self = setmetatable({}, Act)
    self.chapter = chapter or -1
    self.act_requirements = act_requirements or {""}
    self.act_name = act_name or ""
    self.isAccessible = isAccessible or false
    return self
end

function Act:getChapter()
    return self.chapter
end

function Act:setChapter(chapter)
    self.chapter = chapter
end

function Act:getActRequirements()
    return self.act_requirements
end

function Act:setActRequirements(act_requirements)
    self.act_requirements = act_requirements
end

function Act:getActName()
    return self.act_name
end

function Act:setActName(act_name)
    self.act_name = act_name
end


function Act:getIsAccessible()
    return self.isAccessible
end

function Act:setIsAccessible(isAccessible)
    self.isAccessible = isAccessible
end

return Act