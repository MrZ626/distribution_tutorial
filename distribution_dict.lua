-- 基于zita_revive框架自带zict修改得到的独游发行词典事务 https://github.com/26F-Studio/zita_revive

-- 【需要预加载】

local ins,rem,concat=table.insert,table.remove,table.concat
---@type Map<DD.Entry>
local zict

local function reloadZict()
    zict=FILE.load('task/distribution_dict_data.lua','-lua')
end
reloadZict()

assert(zict,"Distribution Dict data not found")

---@type Task_raw
return {
    message=function(S,M,D)
        ---@cast M OneBot.Event.PrivateMessage|OneBot.Event.GroupMessage

        local mes=STRING.trim(RawStr(M.raw_message))
        if not mes:find('#') or mes:find('/#') then return false end

        if mes=="#reload" then
            if Bot.isAdmin(M.user_id) then
                local oldSet,newSet={},{}
                for k in next,zict do oldSet[k]=true end
                reloadZict()
                for k in next,zict do newSet[k]=true end

                local deletion,addition={},{}
                for k in next,oldSet do if not newSet[k] then ins(deletion,k) end end
                for k in next,newSet do if not oldSet[k] then ins(addition,k) end end
                local buf=STRING.newBuf()
                if #deletion>0 then buf:put("[-] "..concat(deletion,";").."\n") end
                if #addition>0 then buf:put("[+] "..concat(addition,";").."\n") end
                local wordCnt,entryCnt=TABLE.getSize(zict)-1,#DD.entryList
                buf:put("知识库已刷新！现在有"..wordCnt.."个关键词和"..entryCnt.."个词条")
                S:send(buf)
            end
            return true
        end

        -- Get entry from dict data
        ---@type DD.Entry
        local entry

        if not entry then
            -- Get searching phrase
            local queryPhrase=mes:match('#.+')
            if not queryPhrase then return false end

            queryPhrase=queryPhrase:sub(2)

            local words=STRING.split(queryPhrase:lower(),'%s+',true)
            if not words[1] then return false end
            while #words>0 and #words[#words]>26 do rem(words) end
            if not words[1] then return false end
            for i=1,#words do if #words[i]>26 then return false end end
            while words[1] do
                entry=zict[concat(words,'')]
                if entry then break end
                rem(words)
            end
            if not entry then
                Bot.reactMessage(M.message_id,Emoji.white_question_mark)
                return false
            end
        end

        -- Response
        local result={} ---@type string[]
        if entry.title then
            ins(result,"#"..entry.title)
        end
        if entry.text then
            ins(result,type(entry.text)=='function' and entry.text(S) or entry.text)
        end
        if entry.link then
            local link=entry.link
            ins(result,"相关链接: "..link)
        end

        local resultStr=concat(result,'\n')

        if S.group and not AdminMsg(M) then
            S:update()
            local chargeNeed=62+#resultStr/2.6
            if S.charge<math.min(62,chargeNeed) then
                Bot.reactMessage(M.message_id,Emoji.snail)
                return true
            end
            S:useCharge(chargeNeed)
            if S.charge<=196 then
                Bot.reactMessage(M.message_id,Emoji.thermometer)
            end
        end

        S:send(resultStr)
        return true
    end,
}
