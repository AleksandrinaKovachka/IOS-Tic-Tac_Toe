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
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didSwitchPlayerName:) name:NOTIFICATION_SWITCH_PLAYER_NAME object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didChangeScore:) name:NOTIFICATION_SWITCH_PLAYER_SCORE object:nil];
    
}

- (IBAction)onClickUndo:(id)sender
{
    [self.gameDelegate undo];
}

- (IBAction)onClickRedo:(id)sender
{
    [self.gameDelegate redo];
}

-(void)getPlayerName:(NSString*)name andAnotherPlayerName:(NSString*)anotherName
{
    self.userNameLabel.text = [NSString stringWithFormat:@"It`s %@ turn", name];
    [self.gameDelegate setPlayerNameInGame:name andAnotherPlayerName:anotherName];
}

-(void)didChangeScore:(NSNotification*)notification
{
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", [notification.object intValue]];
}

-(void)didSwitchPlayerName:(NSNotification*)notification
{
    self.userNameLabel.text = [NSString stringWithFormat:@"It`s %@ turn", notification.object];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EmbedCollectionViewIdentifier"])
    {
        GameCollectionViewController *embedded = (GameCollectionViewController *)segue.destinationViewController;
        self.gameDelegate = embedded;
    }
}


@end
