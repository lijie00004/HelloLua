--切换语言
function LStr(text)
    if Text[text] ~= nil then
        if Config.language == "zh" then
            return Text[text].zh
        elseif Config.language == "en" then
            return Text[text].en
        else
            return ""
        end
    else
        return ""
    end
end

--local bg = createSprite("bg/bg.png", cc.p(size.width/2,size.height/2), layer)
function createSprite(image, positon, parent)
    local sprite = cc.Sprite:create(image)
    sprite:setPosition(positon)
    parent:addChild(sprite)
    return sprite
end

--local bg_title = createScale9Sprite("bg/bg_title.png", cc.p(211.5,365),bg_login, cc.size(265,46))
function createScale9Sprite(image, positon, parent, size )
    local scale9Sprite = ccui.Scale9Sprite:create(image)
    if positon then
        scale9Sprite:setPosition(positon)
    end
    scale9Sprite:setContentSize(size)
    if parent then
        parent:addChild(scale9Sprite)
    end
    return scale9Sprite
end

--local lb_title = createSystemLabel(LStr("Login_01"), "Arial", 20, cc.p(55,27.5), mu_ig, ccc3(252,250,201), ccc3(132,38,5), cc.size(2,-2))
function createSystemLabel(string, font, fontSize, positon, parent, color3B, outlineColor, outlineSize)
    local systemLabel = cc.Label:createWithSystemFont(string, "font", fontSize)
    systemLabel:setPosition(positon)
    if color3B then
        systemLabel:setTextColor(color3B)
    end
    if outlineColor then
        systemLabel:enableOutline(outlineColor,outlineSize)
    end
    parent:addChild(systemLabel)
    return systemLabel
end

function createText(string, font, fontSize, positon, parent, color3B, outlineColor, outlineSize)
    Text = ccui.Text:create(string, font, fontSize)
    Text:setPosition(positon)
    if color3B then
        Text:setTextColor(color3B)
    end
    if outlineColor then
        Text:enableOutline(outlineColor,outlineSize)
    end
    parent:addChild(Text)
    return Text
end

--
function createTTF(string, font, fontSize, positon, parent, color3B, outlineColor, outlineSize)
    local lable = cc.Label:createWithTTF(string, font, fontSize)
    if positon then
        lable:setPosition(positon)
    end
    if color3B then
        lable:setColor(color3B)
    end
    if outlineColor then
        lable:enableOutline(outlineColor,outlineSize)
    end 
    if parent then
    parent:addChild(lable)
    end
    return lable
end