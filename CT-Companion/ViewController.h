//
//  ViewController.h
//  CT Companion
//
//  Created by Tony Xu on 7/23/17.
//  Copyright © 2017 Tony Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ChatSDK/MXChatSDK.h>

@interface ViewController : UIViewController
- (void)startChat;
- (void)initializeMoxtraAccount;
//@property (nonatomic) NSMutableArray<MXChat *> * _Nullable chatArray;
-(MXChat *_Nullable)getChatWithBinderID:(NSString *_Nonnull)binderID;

@end

