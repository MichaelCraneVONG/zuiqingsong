//
//  ChatViewController.h
//  zuiqingsong
//
//  Created by myApple on 16/3/27.
//  Copyright © 2016年 crane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : RCConversationViewController

/**
 *  会话数据模型
 */
@property (strong,nonatomic) RCConversationModel *conversation;
@end
