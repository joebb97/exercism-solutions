local function flatten(input)
    local out = {}
    for _, v in ipairs(input) do
        if type(v) == "table" then
            local temp = flatten(v)
            for _, iv in ipairs(temp) do
                table.insert(out, iv)
            end
        elseif v ~= nil then
            table.insert(out, v)
        end
    end
    return out
end

return flatten
