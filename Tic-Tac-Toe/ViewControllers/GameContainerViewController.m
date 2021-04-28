//
//  GameContainerViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 27.04.21.
//

#import "GameContainerViewController.h"
#import "GameCollectionViewController.h"
#import "Protocols.h"
#import "NotificationNames.h"

//TODO: protocol or notification for score - change in Player

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
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didChangeScore:) name:NOTIFICATION_CHANGE_SCORE object:nil];
    
}

- (IBAction)onClickUndo:(id)sender
{
    [self.undoAndRedoDelegate undo];
}

- (IBAction)onClickRedo:(id)sender
{
    [self.undoAndRedoDelegate redo];
}

-(void)userWithName:(NSString*)name
{
    self.userNameLabel.text = name;
}

-(void)didChangeScore:(NSNotification*)notification
{
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", [notification.object intValue]];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EmbedCollectionViewIdentifier"])
    {
        GameCollectionViewController *embedded = (GameCollectionViewController *)segue.destinationViewController;
        self.undoAndRedoDelegate = embedded;
    }
}


@end
