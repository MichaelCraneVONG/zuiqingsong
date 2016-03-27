//
//  ViewController.m
//  zuiqingsong
//
//  Created by myApple on 16/3/27.
//  Copyright © 2016年 crane. All rights reserved.
//

#import "ViewController.h"
#import "ChatListViewController.h"
#import "ChatViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[RCIM sharedRCIM] initWithAppKey:@"pkfcgjstfb688"];
    [[RCIM sharedRCIM] connectWithToken:@"EXWMfZyf8kWI3grACdqmaLpjJOaqwFeHHIaeoLvowbag43rCVsOmetqnzFPRQ1leISL9KUG4D/qvYaTjaxEeVw==" success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
        dispatch_async(dispatch_get_main_queue(), ^{
            ChatViewController *vc=[[ChatViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"002"];
            self.view.window.rootViewController=vc;
        });
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
//    //新建一个聊天会话View Controller对象
//    RCConversationViewController *chat = [[RCConversationViewController alloc]init];
//    //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
//    chat.conversationType = ConversationType_PRIVATE;
//    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
//    chat.targetId = @"targetIdYouWillChatIn";
//    //设置聊天会话界面要显示的标题
//    chat.title = @"想显示的会话标题";
//    //显示聊天会话界面
//    [self.navigationController pushViewController:chat animated:YES];
//    ChatListViewController *chatList = [[ChatListViewController alloc] init];
//    [self.navigationController pushViewController:chatList animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
