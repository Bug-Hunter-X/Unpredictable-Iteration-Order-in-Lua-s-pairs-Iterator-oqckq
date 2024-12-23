local function foo(t)
  local copy = {}
  for k, v in pairs(t) do
    copy[k] = v
  end
  for k, v in pairs(copy) do
    if type(v) == "table" then
      foo(v)
    end
  end
end

local t = { a = 1, b = { c = 2, d = { e = 3 } } }
foo(t)