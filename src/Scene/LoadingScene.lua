
local size = cc.Director:getInstance():getWinSize()

local LogingScene = class("LogingScene",function()
    return cc.Scene:create()
end)

function LogingScene.create()
    cclog("SceneName    LogingScene")
    local scene = LogingScene.new()
    scene:addChild(scene:createLayer())
    return scene
end


function LogingScene:ctor()
    local function onNodeEvent(event)
        if event == "enter" then--进入场景时触发
            self:onEnter()
        elseif event == "enterTransitionFinish" then--场景进入并且过渡动画完成时候触发
            self:onEnterTransitionFinish()
        elseif event == "exit" then--退出场景时触发
            self:onExit()
        elseif event == "exitTransitionStart" then--场景退出过渡动画开始时候触发
            self:onExitTransitionStart()
        elseif event == "cleanup" then--场景销毁时候触发
            self:cleanup()
        end
    end
    self:registerScriptHandler(onNodeEvent)
end

-- 创建层
function LogingScene:createLayer()
    cclog("LogingScene init")
    local layer = cc.Layer:create()

    local bg = createSprite("bg/bg.png", cc.p(size.width/2,size.height/2), layer)
    local bg_login = createScale9Sprite("bg/bg_login.png", cc.p(size.width/2,size.height/2), bg, cc.size(423,370))
    local bg_title = createScale9Sprite("bg/bg_title.png", cc.p(211.5,365),bg_login, cc.size(265,46))
    local bg_info = createScale9Sprite("bg/bg_info.png", cc.p(211.5,185), bg_login, cc.size(360,250))
    local bg_character = createSprite("bg/character.png", cc.p(350,203),  bg_login)
    local bg_bar = createSprite("bg/bg_bar.png", cc.p(300,203),  bg_login)
    local bg_account = createScale9Sprite("bg/input_box.png", cc.p(170,200), bg_info, cc.size(180, 47))
    local bg_password = createScale9Sprite("bg/input_box.png", cc.p(170,120), bg_info, cc.size(180, 47))

    local lb_title = createSystemLabel(LStr("Login_01"), "Arial", 24, cc.p(134,23), bg_title, ccc3(248,251,15))
    local lb_account = createSystemLabel(LStr("Login_02"), "Arial", 24, cc.p(50,200), bg_info, ccc3(78,38,12))
    local lb_password = createSystemLabel(LStr("Login_03"), "Arial", 24, cc.p(50,120), bg_info, ccc3(78,38,12))

    local mu_ig = cc.MenuItemImage:create("bg/btn_yellow.png","bg/btn_green.png")
    local lb_title = createTTF(LStr("Login_04"), "fonts/hanyi.ttf", 20, cc.p(55,27.5), mu_ig, ccc3(252,250,201),cc.c4b(132,38,5,255),1)
    function mu_ig_Callback(tag, sender)
        cclog("Touch Start Menu Item.")
    end
    mu_ig:registerScriptTapHandler(mu_ig_Callback)
    local mn = cc.Menu:create(mu_ig)
    mn:setPosition(cc.p(180, 40))--130*92
    bg_info:addChild(mn)

    local lllll = createTTF("天天", Config.font, 20, cc.p(240,200), layer, ccc3(252,250,201), cc.c4b(132,38,5,255), 1)
    return layer
end

function LogingScene:onEnter()
    cclog("LogingScene onEnter")
end

function LogingScene:onEnterTransitionFinish()
    cclog("LogingScene onEnterTransitionFinish")
end

function LogingScene:onExit()
    cclog("LogingScene onExit")
end

function LogingScene:onExitTransitionStart()
    cclog("LogingScene onExitTransitionStart")
end

function LogingScene:cleanup()
    cclog("LogingScene cleanup")
end

return LogingScene