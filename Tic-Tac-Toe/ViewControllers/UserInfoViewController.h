//
//  UserInfoViewController.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 27.04.21.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak) id<UserNameDelegate> nameDelegate;

+(instancetype)viewControllerFromStoryboardWithNameDelegate:(id<UserNameDelegate>)nameDelegate;

@end

NS_ASSUME_NONNULL_END
