//
//  ChatViewController.m
//  zuiqingsong
//
//  Created by myApple on 16/3/27.
//  Copyright © 2016年 crane. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.enableSaveNewPhotoToLocalSystem = YES;
    
    if (self.conversationType != ConversationType_CHATROOM) {
        if (self.conversationType == ConversationType_DISCUSSION) {
            [[RCIMClient sharedRCIMClient] getDiscussion:self.targetId success:^(RCDiscussion *discussion) {
                if (discussion != nil && discussion.memberIdList.count>0) {
                    if ([discussion.memberIdList containsObject:[RCIMClient sharedRCIMClient].currentUserInfo.userId]) {
                        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                                  initWithImage:[UIImage imageNamed:@"Setting"]
                                                                  style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(rightBarButtonItemClicked:)];
                    }else
                    {
                        self.navigationItem.rightBarButtonItem = nil;
                    }
                }
            } error:^(RCErrorCode status) {
                
            }];
        }else
        {
//            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
//                                                      initWithImage:[UIImage imageNamed:@"Setting"]
//                                                      style:UIBarButtonItemStylePlain
//                                                      target:self
//                                                      action:@selector(rightBarButtonItemClicked:)];
        }
        
    } else {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rightBarButtonItemClicked:(id)send
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
