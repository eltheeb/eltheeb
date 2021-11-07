function libBase(offset, type, value, name) a = os.clock() gg.setValues({ [1] = { address = gg.getRangesList('libUE4.so' or 'libtersafe.so')[1].start + offset, flags = type, value = value}}) b = os.clock() - a gg.toast(name .. ' MODIFIED \nIN '..b) end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find (szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len (szFullString)) break end nSplitArray[nSplitIndex] = string.sub (szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len (szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. " FAILED TO OPEN") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. " FAILED TO OPEN") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "SUCCESSFULLY OPENED，一ALL TOGETHER" .. xgsl .. "DATA") else gg.toast(qmnb[2]["name"] .. "NO DATA FOUND， FAILED TO OPEN") end end end end function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast("SUCCESSFULLY OPEN，一ALL TOGETHER MODIFIED"..#t.."DATA") gg.addListItems(t) else gg.toast("NOT DATA FOUND，OPEN FAILED", false) return false end else gg.toast("NOT FOUND") return false end end function setvalue(address,flags,value) local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end gg.clearResults() response = 50000 GT = gg.TYPE_DWORD unit = gg.REGION_C_ALLOC edit = 84149249 token = 67371777 function setvalue(address,flags,value) local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end function SearchWrite(Search, Write, Type)    gg.clearResults()    gg.setVisible(false)    gg.searchNumber(Search[1][1], Type)    local count = gg.getResultCount()    local result = gg.getResults(count)    gg.clearResults()    local data = {}     local base = Search[1][2]    if (count > 0) then        for i, v in ipairs(result) do            v.isUseful = true         end        for k=2, #Search do            local tmp = {}            local offset = Search[k][2] - base             local num = Search[k][1]                         for i, v in ipairs(result) do                tmp[#tmp+1] = {}                 tmp[#tmp].address = v.address + offset                  tmp[#tmp].flags = v.flags              end            tmp = gg.getValues(tmp)             for i, v in ipairs(tmp) do                if ( tostring(v.value) ~= tostring(num) ) then                    result[i].isUseful = false                 end            end        end        for i, v in ipairs(result) do            if (v.isUseful) then                data[#data+1] = v.address            end        end        if (#data > 0) then           local t = {}           local base = Search[1][2]           for i=1, #data do               for k, w in ipairs(Write) do                   offset = w[2] - base                   t[#t+1] = {}                   t[#t].address = data[i] + offset                   t[#t].flags = Type                   t[#t].value = w[1]                   if (w[3] == true) then                      local item = {}                       item[#item+1] = t[#t]                       item[#item].freeze = true                       gg.addListItems(item)                   end                                 end           end           gg.setValues(t)           gg.addListItems(t)        else            gg.toast("@CheatPopeye", false)            return false        end    else        gg.toast("Vᴀʟᴜᴇs Nᴏᴛ Fᴏᴜɴᴅ")        return false    end end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) xgsl = xgsl + 1 end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) xgjg = true end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "" .. xgsl .. "") else gg.toast(qmnb[2]["name"] .. "") end end end end function setvalue(address,flags,value) local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end function setvalue(address,flags,value) Virus('Modify address value(Address, value type, value to be modified)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find (szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len (szFullString)) break end nSplitArray[nSplitIndex] = string.sub (szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len (szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "Failed to open") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "Failed to open") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "Successfully opened,Altogether modify" .. xgsl .. "Article data") else gg.toast(qmnb[2]["name"] .. "No data found，Failed to open") end end end end function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast("Successfully opened,Altogether modify"..#t.."Article data") gg.addListItems(t) else gg.toast("No data found,Failed to open", false) return false end else gg.toast("Not Found") return false end end function SearchWrite(Search, Write, Type)    gg.clearResults()    gg.setVisible(false)    gg.searchNumber(Search[1][1], Type)    local count = gg.getResultCount()    local result = gg.getResults(count)    gg.clearResults()    local data = {}     local base = Search[1][2]    if (count > 0) then        for i, v in ipairs(result) do            v.isUseful = true         end        for k=2, #Search do            local tmp = {}            local offset = Search[k][2] - base             local num = Search[k][1]                         for i, v in ipairs(result) do                tmp[#tmp+1] = {}                 tmp[#tmp].address = v.address + offset                  tmp[#tmp].flags = v.flags              end            tmp = gg.getValues(tmp)             for i, v in ipairs(tmp) do                if ( tostring(v.value) ~= tostring(num) ) then                    result[i].isUseful = false                 end            end        end        for i, v in ipairs(result) do            if (v.isUseful) then                data[#data+1] = v.address            end        end        if (#data > 0) then           local t = {}           local base = Search[1][2]           for i=1, #data do               for k, w in ipairs(Write) do                   offset = w[2] - base                   t[#t+1] = {}                   t[#t].address = data[i] + offset                   t[#t].flags = Type                   t[#t].value = w[1]                   if (w[3] == true) then                      local item = {}                       item[#item+1] = t[#t]                       item[#item].freeze = true                       gg.addListItems(item)                   end                                 end           end           gg.setValues(t)           gg.addListItems(t)        else            gg.toast("@CheatPopeye", false)            return false        end    else        gg.toast("Vᴀʟᴜᴇs Nᴏᴛ Fᴏᴜɴᴅ")        return false    end end function setvalue(A0_21, A1_22, A2_23)    local L3_24    L3_24 = {}    L3_24[1] = {}    L3_24[1].address = A0_21   L3_24[1].flags = A1_22   L3_24[1].value = A2_23  gg.setValues(L3_24) end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find (szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len (szFullString)) break end nSplitArray[nSplitIndex] = string.sub (szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len (szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功，一共修改" .. xgsl .. "条数据") else gg.toast(qmnb[2]["name"] .. "未搜索到数据，开启失败") end end end end function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast("开启成功，一共修改"..#t.."条数据") gg.addListItems(t) else gg.toast("未搜索到数据，开启失败", false) return false end else gg.toast("Not Found") return false end end function setvalue(A0_21, A1_22, A2_23)    local L3_24    L3_24 = {}    L3_24[1] = {}                                                                                                                                                                                                                                                                                                 L3_24[1].address = A0_21    L3_24[1].flags = A1_22    L3_24[1].value = A2_23    gg.setValues(L3_24)  end function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) xgsl = xgsl + 1 end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) xgjg = true end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条ΔΘ") else gg.toast(qmnb[2]["name"] .. "开启失败") end end end end function SearchWrite(Search, Write, Type)    gg.clearResults()    gg.setVisible(false)    gg.searchNumber(Search[1][1], Type)    local count = gg.getResultCount()    local result = gg.getResults(count)    gg.clearResults()    local data = {}    local base = Search[1][2]        if (count > 0) then        for i, v in ipairs(result) do            v.isUseful = true         end                for k=2, #Search do            local tmp = {}            local offset = Search[k][2] - base             local num = Search[k][1]                         for i, v in ipairs(result) do                tmp[#tmp+1] = {}                tmp[#tmp].address = v.address + offset                  tmp[#tmp].flags = v.flags              end                       tmp = gg.getValues(tmp)                        for i, v in ipairs(tmp) do                if ( tostring(v.value) ~= tostring(num) ) then                     result[i].isUseful = false                 end            end        end          for i, v in ipairs(result) do            if (v.isUseful) then                 data[#data+1] = v.address            end        end                if (#data > 0) then           gg.toast(""..#data.."")           local t = {}           local base = Search[1][2]           for i=1, #data do               for k, w in ipairs(Write) do                   offset = w[2] - base                   t[#t+1] = {}                   t[#t].address = data[i] + offset                   t[#t].flags = Type                   t[#t].value = w[1]                                      if (w[3] == true) then                       local item = {}                       item[#item+1] = t[#t]                       item[#item].freeze = true                       gg.addListItems(item)                   end                                  end           end           gg.setValues(t)                  else            gg.toast("", false)            return false        end    else                return false    end end
function setvalue(address,flags,value)  local refinevalues={}  refinevalues[1]={}  refinevalues[1].address=address  refinevalues[1].flags=flags  refinevalues[1].value=value  gg.setValues(refinevalues)  end
BIt = gg.getTargetInfo()["x64"]
if BIt == false then
gg.toast("\n" .. gg.getTargetInfo().versionCode .. "\n\n نسخة اللعبة : 32 بت ✔\n" )
else
gg.alert("\n "  .. gg.getTargetInfo().versionCode .. "🔧\n\nنسخة اللعبة : 64 بت ❌\n\nقم بتحميل اللعبة نسخة الـ 32 بت.\n\nو إعادة تشغيل الهاك ⚠️")
os.exit()
end
on = '❰❌❱'
off = '❰✔︎❱'
 -------------------------------------------------------------------------------------------------------------------------------
  os.remove("src/main/java/com/google/errorprone/annotations")
  os.remove("src/main/java/com/google/errorprone/annotations")
  os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
  os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
 ------------------------------------------------------------------------------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------
function HOME()
  SAFEON = gg.multiChoice({
    "⟦☠︎︎️⟧ لوت من حلف الجدار "..lt,
    "⟦☠︎︎️⟧ سبيد نوك "..sp,
    "⟦☠︎︎️⟧ أزالة العشب لوبي "..ng,
    "⟦☠︎︎️⟧ أيم لوك   ⟦☠︎︎️⟧ "..emb,
    "⟦☠︎︎️⟧ ثبات 75  "..nrc50,
    "⟦☠︎︎️⟧  ثبات 100   ⟦☠︎︎️⟧ "..nrc,
    "⟦☠︎︎️⟧ هيدشوت+ماجيك  "..hmg,
    "⟦☠︎︎️⟧ منضور أيباد "..ipd,
    "⟦☠︎︎️⟧ أزالة الضباب "..pov,
    "⟦☠︎︎️⟧ انستا "..ins,
        "⟦☠︎︎️⟧ سرعه متوسطه "..ms,
           "⟦☠︎︎️⟧ t "..t,
    "❌خروج❌"
 }, nil, "⚜Abo Hamzeh VIP⚜")
  if SAFEON == nil then
  else
        if SAFEON[1] == true then
      lot()
        end
    if SAFEON[2] == true then
      spn()
        end
    if SAFEON[3] == true then
      lng()
    end
   if SAFEON[4] == true then
     aim()
    end
    if SAFEON[5] == true then
      lnr50()
    end
    if SAFEON[6] == true then
      lnr100()
    end
    if SAFEON[7] == true then
      HSHOT100()
    end
        if SAFEON[8] == true then
      lipv()
    end
    if SAFEON[9] == true then
      lpov()
    end
        if SAFEON[10] == true then
      anst()
    end
            if SAFEON[11] == true then
      msb()
        end
       if SAFEON[12] == true then
      tt()
        end
               if SAFEON[13] == true then
      EXIT()
        end
  end
  PUBGMH = -1
end

t = off
function tt()
if t == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x67e48b8
setvalue(so+py,16,0)
so=gg.getRangesList('libUE4.so')[1].start
py=0xc6a12000
setvalue(so+py,4,0)
so=gg.getRangesList('libUE4.so')[1].start
py=0xc6b57000
setvalue(so+py,4,0)
gg.toast("🔥speed ok💥")
t = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x67e48b8
setvalue(so+py,16,1.019383e-38)
gg.toast("🔥speed ok💥")
t = off
end
end


ms = off
function msb()
if ms == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x12cfbc4
setvalue(so+py,16,1.873498e+18)
so=gg.getRangesList('libUE4.so')[1].start
py=0x12ddd58
setvalue(so+py,16,4.036353e+17)
so=gg.getRangesList('libUE4.so')[1].start
py=0x12ddc78
setvalue(so+py,16,-2.044617e+18)
so=gg.getRangesList('libUE4.so')[1].start
py=0x1449b34
setvalue(so+py,16,-1.296744e+18)
gg.toast("🔥speed ok💥")
ms = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x12cfbc4
setvalue(so+py,16,1.873498e+18)
so=gg.getRangesList('libUE4.so')[1].start
py=0x12ddd58
setvalue(so+py,16,4.036353e+17)
so=gg.getRangesList('libUE4.so')[1].start
py=0x12ddc78
setvalue(so+py,16,-2.044617e+18)
so=gg.getRangesList('libUE4.so')[1].start
py=0x1449b34
setvalue(so+py,16,-1.296744e+18)
gg.toast("🔥speed ok💥")
ms = off
end
end
sp = off
function spn()
if sp == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x12ee6e8
setvalue(so+py,16,-2.903873e+08)

gg.toast("🔥speed nock ok💥")
sp = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x12ee6e8
setvalue(so+py,16,-2.903873e+08)
gg.toast("🔥speed nock ok💥")
sp = off
end
end
lt = off
function lot()
if lt == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x49716dc
setvalue(so+py,16,0)

gg.toast("🔥loot ok💥")
lt = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x49716dc
setvalue(so+py,16,-3.783139e+28)
gg.toast("🔥loot ok💥")
lt = off
end
end
ins = off
function anst()
if ins == off
then
  so=gg.getRangesList('libUE4.so')[1].start
py=0x3CB8548
setvalue(so+py,16,0)
gg.toast("🔥Instant Hit  تم 💥")
ins = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x3CB8548
setvalue(so+py,16,-1.42781105e28)
gg.toast("🔥Instant Hit  stop 💥")
ins = off
  end
  end
 
emb = off
function aim()
if emb == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x28e462c
setvalue(so+py,16,0)
gg.toast("✓  𝙰𝙸𝙼𝙱𝙾𝚃 𝙰𝙲𝚃𝙸𝚅𝙰𝚃𝙴𝙳")
emb = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x28e462c
setvalue(so+py,16,-1.60921258E16)
gg.toast("✓  𝙰𝙸𝙼𝙱𝙾𝚃 DEA𝙲𝚃𝙸𝚅𝙰𝚃𝙴𝙳")
emb = off
end
end

hmg = off
function HSHOT100()
if hmg == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x40541e0
setvalue(so+py,16,45)
gg.toast("head")
so = gg.getRangesList("libUE4.so")[1].start  
py = 67453408 
setvalue(so + py, 4 ,1110704128)
gg.toast("MAGIC BULLET")
hmg = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x40541e0
setvalue(so+py,16,0)
gg.toast("head off")
so = gg.getRangesList("libUE4.so")[1].start  
py = 0x40541e0 
setvalue(so + py, 16 ,-4.8038264E-14)
gg.toast("MAGIC BULLET off")



hmg = off
end
end

  
nrc = off
function lnr100()
if nrc == off then
so=gg.getRangesList('libUE4.so')[1].start
py=0x14EDC90
setvalue(so+py,16,0)
gg.toast("ثبات سلاح")
so=gg.getRangesList('libUE4.so')[1].start
py=0x1f1e708
setvalue(so+py,4,0)
so=gg.getRangesList('libUE4.so')[1].start
py=0x3b583c0
setvalue(so+py,4,0)
gg.toast("منع اهتزاز السلاح")
so=gg.getRangesList("libUE4.so")[1].start
py=0x14EE248
setvalue(so+py,16,0)
gg.clearResults()
gg.toast("تصغير مؤشر")
so=gg.getRangesList("libUE4.so")[1].start
py=0x1c852b8
setvalue(so+py,16,0)
gg.clearResults()
gg.toast("تأثير القتل")
nrc = on
else
py=0x14EDC90
setvalue(so+py,16,-2.786982e+28)
gg.toast(" ايقاف ثبات سلاح")
so=gg.getRangesList("libUE4.so")[1].start
py=0x1f1e708
setvalue(so+py,16,-2.021173e+24)
so=gg.getRangesList('libUE4.so')[1].start
py=0x3b583c0
setvalue(so+py,4,-1.11445e+28)
gg.toast("أيقاف منع اهتزاز السلاح")
so=gg.getRangesList("libUE4.so")[1].start
py=0x1c852b8
setvalue(so+py,16,-1.30013986e28)
gg.clearResults()
gg.toast("أيقاف تأثير القتل")
so=gg.getRangesList("libUE4.so")[1].start
py=0x14EE248
setvalue(so+py,1,-299890175)
gg.clearResults()
gg.toast("تصغير مؤشر")
nrc = off
end
end


nrc50 = off
function lnr50()
if nrc50 == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x14EDC90
setvalue(so+py,16,0)
gg.toast("ثبات سلاح")
so=gg.getRangesList("libUE4.so")[1].start
py=0x14EE248
setvalue(so+py,16,0)
gg.clearResults()
gg.toast("تصغير مؤشر")
so=gg.getRangesList("libUE4.so")[1].start
py=0x1c852b8
setvalue(so+py,16,0)
gg.clearResults()
gg.toast("تأثير القتل")
nrc50 = on
else
py=0x14EDC90
setvalue(so+py,16,-2.786982e+28)
gg.toast(" ايقاف ثبات سلاح")
so=gg.getRangesList("libUE4.so")[1].start
py=0x1c852b8
setvalue(so+py,16,-1.30013986e28)
gg.clearResults()
gg.toast("أيقاف تأثير القتل")
nrc50 = off
end
end
ipd = off
function lipv()
if ipd == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x3C224E0
setvalue(so+py,16,310)
gg.toast(("iPad View "))
gg.clearResults()
ipd = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x3C224E0
setvalue(so+py,16,360)
gg.toast(("iPad View "))
gg.clearResults()
ipd = off
end
end
ng = off
function lng()
if ng == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x28b2a98
setvalue(so+py,4,0)
gg.clearResults()
gg.toast(' أزالة العشب ')
ng = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x28b2a98
setvalue(so+py,4,-0x1cad0000)
gg.clearResults()
gg.toast(' أيقاف أزالة العشب ')
ng =off
end
end
pov = off
function lpov()
if pov == off
then
so=gg.getRangesList('libUE4.so')[1].start
py=0x30E63D8
setvalue(so+py,4,0)
gg.clearResults()
gg.toast(' ازالة ضباب  ')
pov = on
else
so=gg.getRangesList('libUE4.so')[1].start
py=0x30E63D8
setvalue(so+py,4,-0x11cff5bf)
gg.clearResults()
gg.toast(' أيقاف ازالة ضباب  ')
pov = off
end
end



function EXIT()    
    print('🇯🇴 BY ABOHAMZEH 🇵🇸')
    gg.setVisible(true)
    os.exit()
  end

while true do
  if gg.isVisible(true) then
    PUBGMH = 1
    gg.setVisible(false)
  end
  gg.clearResults()
  if PUBGMH == 1 then
    HOME()
  end
end



