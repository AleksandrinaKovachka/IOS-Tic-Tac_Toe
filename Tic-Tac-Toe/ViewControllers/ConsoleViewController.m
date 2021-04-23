//
//  ConsoleViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 19.04.21.
//

#import "ConsoleViewController.h"
#import "Game.h"

@interface ConsoleViewController ()

@property (strong, nonatomic) Game* game;

@end

@implementation ConsoleViewController

/*-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.boardConsoleLabel.text = self.game.board.description;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.game = [[Game alloc] initWithPlayerName:@"Pesho" inputDelegate:self andOutputDelegate:self];
    self.consoleBoardLabel.text = self.game.board.description;
}

- (IBAction)onClickSubmit:(id)sender
{
    if (self.isCorrectInput)
    {
        [self.game makeMove];
    }
    else
    {
        [self drawErrorState];
    }
    self.inputChoice.text = @"";
}

// MARK: - InputDelegate
- (NSArray<NSArray<NSNumber *> *> *)moveCoordinates
{
    NSArray<NSString *> *coordinatesText = [self.inputChoice.text componentsSeparatedByString:@" "];
    NSArray<NSNumber *> *coordinates = @[@(coordinatesText[0].intValue), @(coordinatesText[1].intValue)];
    return @[coordinates];
}

// MARK: - OutputDelegate

-(void)draw
{
    self.consoleBoardLabel.text = [NSString stringWithFormat:@"%@", self.game.board];
}

-(void)drawGameOver
{
    self.consoleBoardLabel.text = self.game.gameOver;
}

-(void)drawErrorState
{
    self.consoleBoardLabel.text = [@"Not valid input!\n" stringByAppendingString:[NSString stringWithFormat:@"%@", self.game.board]];
}

-(BOOL)isCorrectInput
{
    if([self.inputChoice.text componentsSeparatedByString:@" "].count != 2)
    {
        return NO;
    }
    NSArray<NSNumber*>* coordinates = self.moveCoordinates.firstObject;
    if (coordinates[0].intValue >= 0 && coordinates[0].intValue < 3 && coordinates[1].intValue >= 0 && coordinates[1].intValue < 3) {
        return YES;
    }
    
    return NO;
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
