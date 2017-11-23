//
//  MHAsiNetworkUrl.h
//  MHProject
//
//  Created by MengHuan on 15/4/23.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#ifndef MHProject_MHAsiNetworkUrl_h
#define MHProject_MHAsiNetworkUrl_h


//监听微信支付是否成功
#define ORDER_PAY_NOTIFICATION @"wxpay"

/**
 *  正式环境
 */

//任瑞刚ip
#define API_HOST @"http://192.168.0.245:8080/app/"
#define Imag_Str @"http://192.168.0.245:8080"
//蔡文贤ip
//#define API_HOST @"http://192.168.0.238:8080/app/"
//#define Imag_Str @"http://192.168.0.238:8080"
//彭晓倩ip
//#define API_HOST @"http://192.168.0.239:8080/app/"
//#define Imag_Str @"http://192.168.0.239:8080"



//192.168.0.245:8080/app/mall/appOrder/add
//远程
//#define API_HOST @"http://119.23.221.6/bid/app/"
//#define Imag_Str @"http://119.23.221.6"


//接口路径全拼
#define PATH(_path)  [NSString stringWithFormat:_path, API_HOST]


//登录注册修改密码
//注册
#define Register PATH(@"%@user/register")
//找回密码
#define ResetCode PATH(@"%@appDoctor/findPassword")
//发送验证码
#define SendYZM PATH(@"%@user/getInvalidate")
//登录
#define Login PATH(@"%@user/login")
//退出登录
#define LogOut PATH(@"%@user/logout")

/*
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~我的商城~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */
//首页
#define StoreHomePageOne PATH(@"%@mallHome/homeInfoOne")
#define StoreHomePageTwo PATH(@"%@mallHome/homeInfoThree")
#define StoreHomePageThree PATH(@"%@mallHome/homeInfoFour")

//搜索
#define SearchStore PATH(@"%@mall/appWare/findWareByName")

//更多热卖
#define HotMore PATH(@"%@mall/appWare/hoteWare")

//商品分类一级分类
#define GoodsOneClass PATH(@"%@mall/appClass/classParent")
//商品分类二级分类
#define GoodsTwoClass PATH(@"%@mall/appClass/classChildren")
//根据类别看商品
#define GoosdWithClass PATH(@"%@mall/appWare/findByClass")

//收藏商品
#define LikeWare PATH(@"%@mall/appCollection/collectionWare")

//商品详情
#define WareInfo PATH(@"%@mall/appWare/wareDetails")
//商品评价
#define wareEva PATH(@"%@mall/usercomment/getWareCommentList")

//我的收藏
#define MyLike PATH(@"%@mall/appCollection/list")

//供货商  授权店
#define GetShopList PATH(@"%@mall/appShop/list") //1:授权店  2: 供货商




//订单
//待付款
#define WaitPay PATH(@"%@mall/appOrder/stateList")

/*
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~租房网~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */


//店铺租房分类
#define ShopHouseType PATH(@"%@rent/house/findRentAndSellType")
//分类点击
#define FindHouseWithType PATH(@"%@rent/house/findHouseByCondition")
//搜索酒店
#define SearchHotel PATH(@"%@rent/hotel/searchHotel")
//搜索房源
#define SearchHouse PATH(@"%@rent/house/searchHouse")

//我的出租出售订单列表
#define RentAndSellOrderList PATH(@"%@rent/house/myRentHouse")
//获取出售信息
#define SellInfo PATH(@"%@rent/house/getSellInfo")
//获取出租信息
#define RentInfo PATH(@"%@rent/house/getRentInfo")

//我的出租订单详情
#define RentListInfo PATH(@"%@rent/order/myRentHouse")


//我要租房条件
#define WantRentChange PATH(@"%@rent/house/screenHouseCondition")
//我要租房列表
#define WantRentList PATH(@"%@rent/house/getRentHouse")

/*
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~企业资质~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */




/*
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~我的~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/






//获取个人信息
#define MyInfo PATH(@"%@member/infoDetails")

//个人设置
//修改头像
#define ChangePhoto PATH(@"%@member/uploadFavicon")
//修改密码
#define ChangeCode PATH(@"%@member/updatePassword")
//设置昵称
#define SetNickName PATH(@"%@member/updateNickName")

//上传身份证
#define authentication   PATH(@"%@company/authentication")

//支付
#define AliPayUrl     PATH(@"%@pay/aliPay")
#define WXPayUrl      PATH(@"%@pay/weChatPay")

//充值订单
#define  Create     PATH(@"%@order/create")
//充值成功
#define  paySuccess  PATH(@"%@order/paySuccess")
//充值列表
#define  listByMember    PATH(@"%@order/listByMember")
//消息列表
#define  listById       PATH(@"%@message/listById")
//消息详情
//#define  details        PATH(@"%@message/details")
//消费记录
#define PayList PATH(@"%@purchaseHistory/listById")

//企业标识
#define  updateLogoById       PATH(@"%@company/updateLogoById")
//企业联系列表
#define  companylistById       PATH(@"%@companyTel/listById")
//添加联系人
#define  companyTelcreate     PATH(@"%@companyTel/create")
//删除联系方式
#define  companyTeldelete       PATH(@"%@companyTel/delete")

//企业荣誉证书
#define companyHonor    PATH(@"%@companyHonor/listById")
//删除荣誉证书
#define deleteByIds     PATH(@"%@companyHonor/deleteByIds")
//添加照片
#define  pohotocreate   PATH(@"%@companyHonor/create")

//获取企业项目类型
#define  projectTypesss    PATH(@"%@projectType/findList")
//添加企业信息
#define  companyProjectcreate    PATH(@"%@companyProject/create")
//企业信息列表
#define  companyProjectlistById     PATH(@"%@companyProject/listById")
//删除企业信息
#define  companyProjectdelete      PATH(@"%@companyProject/delete")

//我的企业详情
#define MyCompany PATH(@"%@company/detailsById")
//获取企业头像
#define GetCompanyPhoto PATH(@"%@company/updateInfo")
//续费
#define XuFei PATH(@"%@company/renew")

//关于我们
#define About PATH(@"%@base/aboutUs")
//意见反馈
#define FeedBack PATH(@"%@appFeedback/add")

//免责声明
#define Mzsm PATH(@"%@appSetting/mzsm")

//版本
#define systemgetIOSVersion     PATH(@"%@system/getIOSVersion")




#endif

