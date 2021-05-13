//
//  UserInfoViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 27.04.21.
//

#import "UserInfoViewController.h"
#import "NotificationNames.h"

@interface UserInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *anotherPlayerLabel;
@property (weak, nonatomic) IBOutlet UISwitch *anotherPlayerSwitchState;
@property (nonatomic) NSUInteger index;
@property (strong, nonatomic) NSArray<NSString *>* gameNameArray;
@property (strong, nonatomic) NSArray<NSString *>* imageNameArray;


@end

@implementation UserInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)onClickPlayGame:(id)sender
{
    if (self.userNameTextField.text.length == 0 || (self.anotherPlayerNameTextField.hidden == NO && self.anotherPlayerNameTextField.text.length == 0))
    {
        if (self.userNameTextField.text.length == 0)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.5f animations:^{
                    self.userNameTextField.backgroundColor = [UIColor systemRedColor];
                } completion:^(BOOL finished){
                    self.userNameTextField.backgroundColor = [UIColor clearColor];
                }];
            });
        }
        
        if (self.anotherPlayerNameTextField.hidden == NO && self.anotherPlayerNameTextField.text.length == 0)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.5f animations:^{
                    self.anotherPlayerNameTextField.backgroundColor = [UIColor systemRedColor];
                } completion:^(BOOL finished){
                    self.anotherPlayerNameTextField.backgroundColor = [UIColor clearColor];
                }];
            });
        }
    }
    else
    {
        if (self.index == 0)
        {
            NSString* anotherPlayer = [[NSString alloc] initWithString: self.anotherPlayerSwitchState.on == YES ? self.anotherPlayerNameTextField.text : @"Bot"];
            
            [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICATION_TIC_TAC_TOE_GAME object:nil userInfo:nil];
            [self.nameDelegate getPlayerName:self.userNameTextField.text andAnotherPlayerName:anotherPlayer];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            NSString* anotherPlayer = [[NSString alloc] initWithString: self.anotherPlayerSwitchState.on == YES ? self.anotherPlayerNameTextField.text : @"Bot"];
            
            [NSNotificationCenter.defaultCenter postNotificationName:NOTIFICATION_TUNAK_TUNAK_TUN_GAME object:nil userInfo:nil];
            [self.nameDelegate getPlayerName:self.userNameTextField.text andAnotherPlayerName:anotherPlayer];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}


+(instancetype)viewControllerFromStoryboardWithNameDelegate:(id<UserNameDelegate>)nameDelegate
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserInfoViewController* userInfoController = [storyboard instantiateViewControllerWithIdentifier:@"UserInfoControllerID"];
    userInfoController.nameDelegate = nameDelegate;
    
    return userInfoController;
}

- (IBAction)onSwitchAnotherUser:(id)sender
{
    if (self.anotherPlayerSwitchState.on == YES)
    {
        self.anotherPlayerLabel.hidden = NO;
        self.anotherPlayerNameTextField.hidden = NO;
    }
    else
    {
        self.anotherPlayerLabel.hidden = YES;
        self.anotherPlayerNameTextField.hidden = YES;
    }
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TemplatePageViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}
 
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TemplatePageViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.gameNameArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (TemplatePageViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.gameNameArray count] == 0) || (index >= [self.gameNameArray count])) {
        return nil;
    }
    
    TemplatePageViewController* templatePageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TemplatePageID"];
    templatePageViewController.imageName = self.imageNameArray[index];
    templatePageViewController.gameNameText = self.gameNameArray[index];
    templatePageViewController.pageIndex = index;
    self.index = index;
    
    return templatePageViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.gameNameArray.count;
}
 
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EmbedGameTypePageViewControllerID"])
    {
        self.gameNameArray = @[@"Tic-Tac-Toe", @"Tunak-Tunak-Tun"];
        self.imageNameArray = @[@"logo", @"logoTunakTunakTun"];
        self.gameSelection = (UIPageViewController *)segue.destinationViewController;
        self.gameSelection.dataSource = self;
        TemplatePageViewController* templateViewController = [self viewControllerAtIndex:0];
        [self.gameSelection setViewControllers:@[templateViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    }
}


@end
