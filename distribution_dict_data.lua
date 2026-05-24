---@class DD.Entry
---@field word string
---@field title? string
---@field text? string
---@field link? string

local zict={entryList={}}
local function checkWords(entry)
    if entry.word:find("；") then
        LOG('warn', "Fullwidth semicolon found in entry '"..entry.title.."'")
    end
end
local function loadData(data)
    for _,entry in next,data do
        checkWords(entry)
        for _,word in next,STRING.split(entry.word, ";") do
            word=SimpStr(word)
            if zict[word] then
                LOG('warn', "Repeat Keyword: "..word)
            else
                zict[word]=entry
            end
        end
        table.insert(zict.entryList, entry)
    end
end

---@type DD.Entry[]
local orig={
    {
        word="发行商说1;1",
        title="独立游戏到底需要发行吗？",
        link="b23.tv/BV1A4yrYkEfq",
    },
    {
        word="发行商说2;2",
        title="海外发行分析，明末：渊虚之羽能成为下一个黑神话嘛？",
        link="b23.tv/BV1kc1YYnEsx",
    },
    {
        word="发行商说3;3",
        title="做独立游戏一定要了解的三个致命问题",
        link="b23.tv/BV1VMUeYjEKY  文案 bilibili.com/opus/1000723952614506551",
    },
    {
        word="发行商说4;4",
        title="版金&预付，是福？还是坑？独立游戏该不该接？",
        link="b23.tv/BV1ZJzaYoErH  文案 bilibili.com/opus/1005892954351468548",
    },
    {
        word="发行商说5;5",
        title="独立游戏如何无成本自发海外？海外发行商教你！社交媒体篇",
        link="b23.tv/BV1vF6ZY8E3v  文案 bilibili.com/opus/1022093360539631625",
    },
    {
        word="发行商说6;6",
        title="独立游戏无成本海外自发必学！超好用工具！UTM analytics！",
        link="b23.tv/BV13ycJeBE9A",
    },
    {
        word="发行商说7;7",
        title="如何白嫖steam愿望单？海外发行商教你如何无成本自研自发！",
        link="b23.tv/BV1W7cQejE2n",
    },
    {
        word="发行商说8;8",
        title="海外发行建议大家不要找发行【以及TBNT企划】",
        link="b23.tv/BV1wYALe7E4x  文案 bilibili.com/opus/1034616127976636440",
    },
    {
        word="发行商说9;9",
        title="如何看游戏发行合同？海外发行商教你！另附韩国发行合同",
        link="b23.tv/BV18XAoeyEkP",
    },
    {
        word="发行商说10;10",
        title="独立游戏如何正确立项？简单！海外发行教你！",
        link="b23.tv/BV1S49zYKEjp  文案 bilibili.com/opus/1041544627480428592",
    },
    {
        word="发行商说11;11",
        title="独立游戏到底什么时候上steam页面？",
        link="b23.tv/BV1qNQFYcEcJ  文案 bilibili.com/opus/1044140909448396806",
    },
    {
        word="发行商说12;12",
        title="2025年还能做独立游戏嘛？很卷？发行商告诉你",
        link="b23.tv/BV1RyZ5YHEH3  文案 bilibili.com/opus/1049336282274070564",
    },
    {
        word="发行商说13;13",
        title="Demo？playtest？prologue？这些都是什么？有什么区别？",
        link="b23.tv/BV1mHdmYbEBp",
    },
    {
        word="发行商说14;14",
        title="Steam称：愿望单无用！外部流量无用！",
        link="b23.tv/BV1ba5izMEM9  文案 bilibili.com/opus/1056759055196880914",
    },
    {
        word="发行商说15;15",
        title="独立游戏EA必死！EA到底是什么？",
        link="b23.tv/BV1yYL7zmEim  文案 bilibili.com/opus/1059737889911341056",
    },
    {
        word="发行商说16;16",
        title="中国玩家占比50%？谣言！",
        link="b23.tv/BV1fHVmzSE6a  文案 bilibili.com/opus/1063832415339806728",
    },
    {
        word="发行商说17;17",
        title="倾囊相授！独立游戏0成本海外宣发！",
        link="b23.tv/BV1XBVSz2Ef3  文案 bilibili.com/opus/1065292798751670328",
    },
    {
        word="发行商说18;18",
        title="独立游戏不花钱海外宣发教程！如何靠demo获得steam推流？",
        link="b23.tv/BV1L9M7zUEf1  文案 bilibili.com/opus/1077927007656869890",
    },
    {
        word="发行商说19;19",
        title="愿望单有多重要？中国愿望单没用！愿望单到底有什么用？",
        link="b23.tv/BV1taKNztEc1  文案 bilibili.com/opus/1080537669171150851",
    },
    {
        word="发行商说20;20",
        title="海外发行教你如何选择发行商！第二期TBNT开启！",
        link="b23.tv/BV1WA37zeEF3  文案 bilibili.com/opus/1085769841307025409",
    },
    {
        word="发行商说21;21",
        title="独立游戏使用AI会不会影响销量和评价？",
        link="b23.tv/BV1nTHLzJES3  文案 bilibili.com/opus/1121753438102749204",
    },
    {
        word="发行商说22;22",
        title="新手千万不要做联机游戏！",
        link="b23.tv/BV1bFx2zFECr  文案 bilibili.com/opus/1122073000794914823",
    },
    {
        word="发行商说23;23",
        title="新品节千万别放demo，会让游戏完蛋的！",
        link="b23.tv/BV1rF4czxE9e  文案 bilibili.com/opus/1122436715856789509",
    },
    {
        word="发行商说24;24",
        title="新品节愿望单翻倍？详解新品节推流机制！",
        link="b23.tv/BV1uu4izTEXx  文案 bilibili.com/opus/1123940534215245876",
    },
    {
        word="发行商说25;25",
        title="傻子都能看懂！保姆级海外宣发教学！",
        link="b23.tv/BV1fFWyzeEyC  文案 bilibili.com/opus/1124667968492404757",
    },
    {
        word="发行商说26;26",
        title="独立游戏千万别做国内宣发！",
        link="b23.tv/BV1HKswzWE3V  文案 bilibili.com/opus/1127852746886610951",
    },
    {
        word="发行商说27;27",
        title="独立游戏一定要有宣发！",
        link="b23.tv/BV1urCxBYE6E  文案 bilibili.com/opus/1135086902039281666",
    },
    {
        word="发行商说28;28",
        title="千万不要在steam上做免费游戏！",
        link="b23.tv/BV1N7yPBYEXQ  文案 bilibili.com/opus/1137673082221101057",
    },
    {
        word="发行商说29;29",
        title="独立游戏好做吗？到底该不该入行？",
        link="b23.tv/BV1YaSMBTEk6  文案 bilibili.com/opus/1140271511677960212",
    },
    {
        word="发行商说30;30",
        title="独立游戏追热点真的靠谱吗？",
        link="b23.tv/BV1uH2eBFEpw  文案 bilibili.com/opus/1142871903955845121",
    },
    {
        word="发行商说31;31",
        title="独立游戏出海可以用AI翻译吗？会被老外骂吗？",
        link="b23.tv/BV1NS2yBDELg  文案 bilibili.com/opus/1145494930633785350",
    },
    {
        word="发行商说32;32",
        title="什么是独立游戏？海外高分游戏论文告诉你！",
        link="b23.tv/BV1yomRBUEek  文案 bilibili.com/opus/1145865388780683303",
    },
    {
        word="发行商说33;33",
        title="做独立游戏不需要传统发行！",
        link="b23.tv/BV1UaqZBTEV2  文案 bilibili.com/opus/1148058635296833540",
    },
    {
        word="发行商说34;34",
        title="中国独立游戏行业为什么这么落后？国内玩家是罪魁祸首！",
        link="b23.tv/BV1gNBMBiE1Q  文案 bilibili.com/opus/1150661905152475153",
    },
    {
        word="发行商说35;35",
        title="独游开发者必看！中国玩家如何伤害开发者？",
        link="b23.tv/BV1LsivBSEo7  文案 bilibili.com/opus/1153619462574833673",
    },
    {
        word="发行商说36;36",
        title="开发者必看！中国玩家的单机游戏赢学从何而来？",
        link="b23.tv/BV1TBi9B9EtS  文案 bilibili.com/opus/1155856285829169161",
    },
    {
        word="发行商说37;37",
        title="保姆级教程！独游新人如何开始第一款游戏？",
        link="b23.tv/BV1iFrkBmEMw  文案 bilibili.com/opus/1158452941508575232",
    },
    {
        word="发行商说38;38",
        title="保姆级教程！steam商店页面到底该如何装修？",
        link="b23.tv/BV1LWzMB7Ekd  文案 bilibili.com/opus/1161041183252676624",
    },
    {
        word="发行商说39;39",
        title="开了steam商店页面，愿望单不多怎么办？",
        link="b23.tv/BV1vK6BBPEmf  文案 bilibili.com/opus/1163643568356589571",
    },
    {
        word="发行商说40;40",
        title="游戏PV千万不能这么做！新人常见几大误区！",
        link="b23.tv/BV1evFkzbE5N  文案 bilibili.com/opus/1166275481396314120",
    },
    {
        word="发行商说41;41",
        title="什么时候开steam页面？保姆级教程！",
        link="b23.tv/BV159Z7BpERP  文案 bilibili.com/opus/1169191927414784020",
    },
    {
        word="发行商说42;42",
        title="什么是steam demo？千万别搞错了！",
        link="b23.tv/BV13YfuBZELL  文案 bilibili.com/opus/1171438410022256643",
    },
    {
        word="发行商说42.5;42.5",
        title="必看！Steam新品节注意事项！",
        link="b23.tv/BV12ufwBcErp  文案 bilibili.com/opus/1172174387047038998",
    },
    {
        word="发行商说43;43",
        title="2月份新品节深度解析!Steam未来可能会有大动作！",
        link="b23.tv/BV14eP4zUE78  文案 bilibili.com/opus/1176978484068614163",
    },
    {
        word="发行商说44;44",
        title="demo也有商店页面？demo改版过？",
        link="b23.tv/BV1gKcDzLEsF",
    },
    {
        word="发行商说45;45",
        title="所有独游发行看过来！我们要带你们颠覆行业！",
        link="b23.tv/BV1LFdgBbEbX",
    },
}

---@type DD.Entry[]
local keyConcepts={
    {
        word="发行商说",
        text="《发行商说》是True Blue关于自研自发的系列视频，可发送 #1 ~ #"..#orig.." 查看对应视频\n第一期传送门 b23.tv/BV1A4yrYkEfq",
    },
    {
        word="发行",
        text="游戏制作分为研发-发行两个环节。对于独立游戏开发，如果你真的不想碰社交媒体，不想分析后台数据，更不擅长营销，只想安安心心画画做歌写代码，有人帮忙把游戏卖掉就行，那你才要找 #发行商",
    },
    {
        word="发行商",
        text="(传统)发行商是专职负责发行环节的角色，工作职责包含发推文、入驻discord参与社区管理等",
    },
    {
        word="版金;预付",
        text="版金、预付等词汇在一些游戏发行合同中不是严谨概念，一切以合同文本为准，详见 #4",
    },
    {
        word="社媒;社交媒体",
        text="对于独游海外发行来说需要重点操作的是X和Discord，详见 #5",
    },
    {
        word="UTM;UTM链接;UTM分析",
        text="steam商店页url后可选附带参数utm_source=test123，在Steam后台可以分析点击来源，详见 #6",
    },
    {
        word="愿望单",
        text="愿望单是一种功能。获取方式详见 #7\n获取有效潜在用户的愿望单会对后续推流有帮助，详见 #14 #19",
    },
    {
        word="自发;自研自发",
        text="推荐新人做一下自发，就算以后打算找别人发行，自己也最好做一遍对发行知根知底，只需要高中英语水平，详见 #8",
    },
    {
        word="合同;发行合同",
        text="详见 #9 #20",
    },
    {
        word="立项;如何立项",
        text="1.优先立确定做得完的小项目\n2.参考 Games-Stats.com 别做数据差的\n3.不知道怎么选就做3D恐怖/模拟类\n详见 #10 #30",
    },
    {
        word="商店页;商店页面;steam商店页;steam商店页面;demo商店页;demo商店页面;demo独立商店页;独立商店页",
        text="开商店页时机详见 #11，装修原则详见 #38，Demo独立商店页详见 #44",
    },
    {
        word="demo",
        text="Demo通过免费产品判定标准（游玩时长中位数）获得流量，间接为完整版增加销量，详见 #13 #18 #42",
    },
    {
        word="playtest",
        text="Demo偏试吃样品，Playtest偏测试，一般还是推荐做Demo获得额外推流，详见 #13",
    },
    {
        word="序章;prologue",
        text="序章是历史遗留的Steam发售策略，现在不要去做了，详见 #13",
    },
    {
        word="ea;early access;抢先体验",
        text="正常情况完全不用考虑EA，详见 #15",
    },
    {
        word="海外宣发",
        text="独立游戏海外宣发主要渠道是社交媒体，详见 #17 #18 #25",
    },
    {
        word="AI;AI美术",
        text="如果你不用AI自己也能做，那你才可以用，否则不要想着用；用了记得在Steam标明否则会被罚，详见 #21",
    },
    {
        word="AI音乐",
        text="相对AI美术争议稍微小一点，熟悉音乐流派和常见用途的话拿来铺氛围通常可用；用了记得在Steam标明否则会被罚，详见 #21",
    },
    {
        word="联机;MMO",
        text="新人别碰任何形式的多人交互联机，有经验也最多做联机并且不要当成卖点，详见 #22",
    },
    {
        word="上Demo;上架Demo;Demo上架;新品节",
        text="把机制利用得最好的流程：发Demo并打磨-带Demo上新品节-发售，详见 #23 #24 #42",
    },
    {
        word="保姆;保姆系列;保姆教程;保姆级教程",
        text="详见 #25 #37 #38 #41",
    },
    {
        word="国内;国内宣发",
        text="独游国内宣发渠道不成熟，玩家普遍偏挑剔不理性，买量转化率过低，推荐先做0成本海外然后回头做国内，详见 #26 #34 #35 #36",
    },
    {
        word="必须宣发;必须做宣发;一定要宣发;一定要做宣发;宣发必要性",
        text="能出现自来水滚雪球的是好游戏，但好游戏不都会被玩家自发宣传，开发和宣发都是必要的，详见 #27",
    },
    {
        word="免费;免费发售;发免费;不要发免费",
        text="纯发着玩去itch，来steam钱都交了那就卖，免费付费的机制完全不同，积累不了什么经验，详见 #28",
    },
    {
        word="AI翻译;AI本地化;机翻",
        text="只要不是重剧情的必须看字的品类就可以机翻，不会被骂，实在不敢就标注一下成本有限请不了专业翻译不得不机翻，详见 #31",
    },
    {
        word="独立;独立游戏;indie;independent",
        text="有历史遗留与舆论战场问题，推荐参考的三个维度是：财务独立、创作独立、发行独立，满足一个能叫独立，全部满足是纯血独立，详见 #32",
    },
    {
        word="TBNT",
        text="True Blue的新式发行服务，大致上是开局不交钱光告诉你该怎么做，你照着操作赚到钱了自觉按比例分点给TB\n群公告有报名链接，详见#33 #45",
    },
    {
        word="PV;宣传视频;宣传片;预告片",
        text="PV的本质是产品介绍，在尽可能短的时间内明确描述产品的特点和卖点。别开屏logo，别超过40秒，最后写上“立刻添加愿望单”，需要做多语言，详见 #40",
    },
}

---@type DD.Entry[]
local keyConcepts2={
    {
        word="语言",
        text="语言支持会影响推流推给谁，优先支持中英日，其它的没时间加就算了\n另见Steam文献库 “在 Steam 上曝光”",
    },
    {
        word="流量;点击",
        text="商店页面的点击和转化率本身不重要，不影响推流\n另见Steam文献库 “在 Steam 上曝光”",
    },
    {
        word="评论;好评;差评;好评率",
        text="好评率只会在低于40%时扣分，其余情况都没差 不用管\n另见Steam文献库 “在 Steam 上曝光”",
    },
}

---@type DD.Entry[]
local utils={
    {
        word="help",
        text="这里是MrZ的独游宣发便民bot，可以发送例如 #愿望单 查询各种常见概念",
        link="github🐙.com/MrZ626/distribution_tutorial （去掉防吞章鱼）",
    },
    {
        word="TB;True Blue",
        text="独立游戏海外发行服务商",
        link="space.bilibili.com/6094118",
    },
    {
        word="勇哥",
        title="最近比较火的提供餐饮业开店咨询的勇哥，有不少出圈名场面",
        link="space.bilibili.com/3546801669933097",
    },
    {
        word="模拟;模拟类;模拟器;经营模拟;模拟经营;恐怖;3D恐怖;恐怖类;3D恐怖类",
        text="3D恐怖和模拟经营是高度推荐的新手品类，开发难度相对低，销售数据普遍也较好",
    },
}

loadData(orig)
loadData(keyConcepts)
loadData(keyConcepts2)
loadData(utils)

LOG('info', "Distribution Dict Data Loaded, total "..#zict.entryList.." entries")

return zict
