#! lua

function split(str, del)
 p, nrep = str:gsub("%s*"..del.."%s*", "")
 return { str:match((("%s*(.-)%s*"..del.."%s*"):rep(nrep).."(.*)")) }
end

print("aaa, bbb, ccc")
print(split("aaa, bbb, ccc", ","))