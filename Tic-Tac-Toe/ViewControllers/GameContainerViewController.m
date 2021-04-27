//
//  GameContainerViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 27.04.21.
//

#import "GameContainerViewController.h"
#import "GameCollectionViewController.h"
#import "Protocols.h"

@interface GameContainerViewController ()

@end

@implementation GameContainerViewController

-(void)viewDidAppear:(BOOL)animated
{
    UserInfoViewController* user = [UserInfoViewController viewControllerFromStoryboardWithNameDelegate:self];
    [self presentViewController:user animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scoreLabel.text = @"Score: 0";
    
}

- (IBAction)onClickUndo:(id)sender
{
    
}

- (IBAction)onClickRedo:(id)sender
{
    
}

-(void)userWithName:(NSString*)name
{
    self.userNameLabel.text = name;
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
