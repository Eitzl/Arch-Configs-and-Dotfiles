-- Keep 1-5 alive when empty so Noctalia's workspace indicator always shows them.
for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), persistent = true })
end
