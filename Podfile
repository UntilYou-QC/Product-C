platform :ios, '8.0'
target ‘Product-C’ do
pod 'SVProgressHUD', '~> 2.0.3'
pod 'SDWebImage', '~> 3.8.1'
pod 'Masonry', '~> 1.0.1'
# Mob产品公共库
pod 'MOBFoundation_IDFA'
# SMSSDK必须
pod 'SMSSDK'
# 主模块(必须)
pod 'ShareSDK3'
# Mob 公共库(必须) 如果同时集成SMSSDK iOS2.0:可看此注意事项：http://bbs.mob.com/thread-20051-1-1.html
#pod 'MOBFoundation'
# UI模块(非必须，需要用到ShareSDK提供的分享菜单栏和分享编辑页面需要以下1行)
pod 'ShareSDK3/ShareSDKUI'
# 平台SDK模块(对照一下平台，需要的加上。如果只需要QQ、微信、新浪微博，只需要以下3行)
pod 'ShareSDK3/ShareSDKPlatforms/QQ'
pod 'ShareSDK3/ShareSDKPlatforms/SinaWeibo'
pod 'ShareSDK3/ShareSDKPlatforms/WeChat'
end