//
//  ViewController.m
//  CT Companion
//
//  Created by Tony Xu on 7/23/17.
//  Copyright © 2017 Tony Xu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <ChatSDK/MXChatSDK.h>



@interface ViewController ()
@property (nonatomic, weak) MXChatListModel *chatListModel;
@property (nonatomic, strong) NSMutableArray<MXChat *> *chatList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.myViewController = self;
    [MXChatClient sharedInstance].delegate = self;
    self.title = @"CT-Companion";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray<MXChat *> *)chatList
{
    if (_chatList == nil)
    {
        _chatList = [[NSMutableArray alloc] init];
    }
    return _chatList;
}

- (MXChatListModel *)chatListModel
{
    if (_chatListModel == nil)
    {
        _chatListModel = [[MXChatListModel alloc] init];
        _chatListModel.delegate = self;
    }
    return _chatListModel;
}

- (void)startChat
{
    NSLog(@"starting chat");
    self.chatList = [self.chatListModel.chats mutableCopy];
    self.chatListModel = [[MXChatListModel alloc] init];
    MXChat *chat = [self getChatWithBinderID:@"BzdaMristjb8KzAsknIsRtC"];
    if (chat) {
        NSLog(@"chat found");
        MXChatViewController *chatViewController = [[MXChatViewController alloc] initWithChat:chat];
        chatViewController.edgesForExtendedLayout = UIRectEdgeNone;
        [self.navigationController pushViewController:chatViewController animated:YES];
    }
    
}

-(MXChat *)getChatWithBinderID:(NSString *)binderID{
    NSLog(@"Getting Chat");
    NSUInteger index = [self.chatList indexOfObjectPassingTest:^BOOL(MXChat * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop){
        NSLog(obj.chatId);
        if ([obj.chatId isEqualToString:binderID]) {
            return true;
        }
        return false;
    }];
    if (index != NSNotFound) {
        return [self.chatList objectAtIndex:index];
    }
    return nil;
}

@end
