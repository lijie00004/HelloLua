
require "cocos.init"
require "Config"
require "Function"
require "Text"

--设计分辨率大小
local designResolutionSize = cc.size(480, 854)--设计大小


cclog = function(...)
    print(string.format(...))
end

local function main()
    collectgarbage("collect")
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

    --添加路径
    local sharedFileUtils = cc.FileUtils:getInstance()
    sharedFileUtils:addSearchPath("src")
    sharedFileUtils:addSearchPath("res")

    --获取屏幕大小
    local director = cc.Director:getInstance()
    local glview = director:getOpenGLView()

    -- 设置设计分辨率策略
    glview:setDesignResolutionSize(designResolutionSize.width, designResolutionSize.height, cc.ResolutionPolicy.FIXED_WIDTH)

    --设置是否显示帧率和精灵个数
    director:setDisplayStats(true)

    --设置帧率
    director:setAnimationInterval(1.0 / 60)

    local language = cc.UserDefault:getInstance():getStringForKey("LANGUAGE")
    if language == "" then
        if cc.Application:getInstance():getCurrentLanguage() == cc.LANGUAGE_CHINESE then
              cc.UserDefault:getInstance():setStringForKey("LANGUAGE","zh")
              Config.language = "zh"
        else          
              cc.UserDefault:getInstance():setStringForKey("LANGUAGE","en")
              Config.language = "en"
        end
    else
        Config.language = language
    end

 
    --create scene 
    local scene = require("Scene.LoadingScene")
    local gameScene = scene.create()

    if cc.Director:getInstance():getRunningScene() then
        cc.Director:getInstance():replaceScene(gameScene)
    else
        cc.Director:getInstance():runWithScene(gameScene)
    end

end


local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    error(msg)
end
