
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
    self.bg_login = createScale9Sprite("bg/bg_login.png", cc.p(size.width/2,size.height/2), layer, cc.size(423,370))
    local bg_title = createScale9Sprite("bg/bg_title.png", cc.p(211.5,365),self.bg_login, cc.size(265,46))
    local bg_info = createScale9Sprite("bg/bg_info.png", cc.p(211.5,185), self.bg_login, cc.size(360,250))
    local bg_character = createSprite("bg/character.png", cc.p(350,203),  self.bg_login)

    --创建账号
    local function OnClickMenu(tag, menuItemSender)
        self.bg_login:setVisible(false)
        local registerLayer = self:createRegisterLayer()
        self:addChild(registerLayer)

    end
    local bg_bar = createSprite("bg/bg_bar.png", cc.p(295,44),  self.bg_login)--cc.p(109.5,21)
    local lb_title = createTTF(LStr("Login_05"), font, font_24, nil, nil, color_1,color_2,1)
    local mu_title = cc.MenuItemLabel:create(lb_title)
    mu_title:registerScriptTapHandler(OnClickMenu)
    local mn_title = cc.Menu:create(mu_title)
    mn_title:setPosition(cc.p(109.5,21))--130*92
    bg_bar:addChild(mn_title)

    local bg_account = createScale9Sprite("bg/input_box.png", nil, nil, cc.size(180, 47))
    --local bg_password = createScale9Sprite("bg/input_box.png", nil, nil, cc.size(180, 47))

    local eb_account = ccui.EditBox:create(cc.size(180, 47),bg_account)
    eb_account:setMaxLength(7)
    --eb_account:setText("")
    cclog(eb_account:getText())
    eb_account:setFontColor(color_1)
    eb_account:setFont(font,font_24)
    eb_account:setPlaceholderFont(font,font_20)
    eb_account:setPlaceHolder(LStr("Login_06"))
    --eb_account:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
    --eb_account:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
    eb_account:setPosition(cc.p(170,200))
    bg_info:addChild(eb_account)

    local eb_password = ccui.EditBox:create(cc.size(180, 47),bg_account)
    eb_password:setMaxLength(12)
    --eb_account:setText("")
    cclog(eb_password:getText())
    eb_password:setFontColor(color_1)
    eb_password:setFont(font,font_24)
    eb_password:setPlaceholderFont(font,font_20)
    eb_password:setPlaceHolder(LStr("Login_07"))
    --eb_account:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
    --eb_account:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
    eb_password:setPosition(cc.p(170,120))
    bg_info:addChild(eb_password)
    

    local lb_title = createTTF(LStr("Login_01"), font, font_24, cc.p(134,23), bg_title, color_3)
    local lb_account = createTTF(LStr("Login_02"), font, font_24, cc.p(50,200), bg_info, color_4)
    local lb_password = createTTF(LStr("Login_03"), font, font_24, cc.p(50,120), bg_info, color_4)

    local mu_ig = cc.MenuItemImage:create("bg/btn_yellow.png","bg/btn_green.png")
    local lb_title = createTTF(LStr("Login_04"), font, font_24, cc.p(55,27.5), mu_ig, color_1,color_2,1)
    function mu_ig_Callback(tag, sender)
        cclog("11111111111111.")
    end
    mu_ig:registerScriptTapHandler(mu_ig_Callback)
    local mn = cc.Menu:create(mu_ig)
    mn:setPosition(cc.p(180, 40))--130*92
    bg_info:addChild(mn)


    return layer
end

function LogingScene:createRegisterLayer()
    local layer = cc.Layer:create()
    local bg_login = createScale9Sprite("bg/bg_login.png", cc.p(size.width/2,size.height/2), layer, cc.size(447,500))
    local bg_title = createScale9Sprite("bg/bg_title.png", cc.p(223.5,495),bg_login, cc.size(265,46))
    local lb_title = createTTF(LStr("Login_01"), font, font_24, cc.p(134,23), bg_title, color_3)

    --关闭按钮
    local function menuCloseCallback(sender, eventType)
        if eventType == ccui.TouchEventType.ended then
            self.bg_login:setVisible(true)
            self:removeChild(layer, true)
        end
    end
    local btn_close = ccui.Button:create("bg/btn_close.png", "bg/btn_close.png")
    btn_close:setPosition(430,490)
    btn_close:addTouchEventListener(menuCloseCallback)
    btn_close:setPressedActionEnabled(true)
    bg_login:addChild(btn_close)

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