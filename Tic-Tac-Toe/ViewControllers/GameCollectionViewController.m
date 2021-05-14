//
//  GameCollectionViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 23.04.21.
//

#import "GameCollectionViewController.h"
#import "Game.h"
#import "TicTacToeGame.h"
#import "TunakTunakTunGame.h"
#import "GameCollectionViewCell.h"
#import "GameOverViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface GameCollectionViewController ()

@property (strong, nonatomic) Game* curGame;
@property (strong, nonatomic) Game* ticTacToeGame;
@property (strong, nonatomic) Game* tunakTunakTunGame;
@property (assign) int lastSelected;

@end

@implementation GameCollectionViewController

static NSString * const reuseIdentifier = @"GameCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.ticTacToeGame = [[TicTacToeGame alloc] initWithInputDelegate:self andOutputDelegate:self];
    self.tunakTunakTunGame = [[TunakTunakTunGame alloc] initWithInputDelegate:self andOutputDelegate:self];
    
    self.curGame = self.ticTacToeGame;
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didChooseTicTacToeGame:) name:NOTIFICATION_TIC_TAC_TOE_GAME object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didChooseTunakTunakTunGame:) name:NOTIFICATION_TUNAK_TUNAK_TUN_GAME object:nil];
}

-(void)didChooseTicTacToeGame:(NSNotification*)notification
{
    self.curGame = self.ticTacToeGame;
}

-(void)didChooseTunakTunakTunGame:(NSNotification*)notification
{
    self.curGame = self.tunakTunakTunGame;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)undo
{
    [self.curGame undo];
    [self.collectionView reloadData];
}

-(void)redo
{
    [self.curGame redo];
    [self.collectionView reloadData];
}

-(void)setPlayerNameInGame:(NSString*)name andAnotherPlayerName:(NSString*)anotherName
{
    [self.curGame changePlayerNameWith:name andAnotherPlayerName:anotherName];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.curGame.board.boardCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GameCell" forIndexPath:indexPath];
    
    NSArray<NSNumber*>* boardStates = self.curGame.board.stateDescription;
    NSString* imageName;
    
    if (boardStates[indexPath.item].intValue == 0)
    {
        imageName = @"None";
    }
    else if (boardStates[indexPath.item].intValue == 1)
    {
        imageName = @"X";
    }
    else if (boardStates[indexPath.item].intValue == 2)
    {
        imageName = @"O";
    }
    else if (boardStates[indexPath.item].intValue == 3)
    {
        imageName = @"Green";
    }
    else if (boardStates[indexPath.item].intValue == 4)
    {
        imageName = @"Yellow";
    }
    else if (boardStates[indexPath.item].intValue == 5)
    {
        imageName = @"Red";
    }

    cell.stateImages.image = [UIImage imageNamed:imageName];
    [cell layoutSubviews];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    int lastSelectedCell = self.lastSelected;
    
    self.lastSelected = (int) indexPath.item;
    
    if ([self.curGame.board isCorrectMove:[self moveCoordinates]])
    {
        [self.curGame makeMove];
    }
    else
    {
        self.lastSelected = lastSelectedCell;
        int soundChoice = arc4random_uniform((uint32_t)1);
        if (soundChoice == 0)
        {
            NSString* path = [NSBundle.mainBundle.resourcePath stringByAppendingPathComponent:@"spank-3.mp3"];
            NSURL* soundUrl = [NSURL fileURLWithPath:path];
            
            AVAudioPlayer* audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
            
            [audioPlayer play];
        }
        else
        {
            NSString* path = [NSBundle.mainBundle.resourcePath stringByAppendingPathComponent:@"wrong_4wlZSJh.mp3"];
            NSURL* soundUrl = [NSURL fileURLWithPath:path];
            
            AVAudioPlayer* audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
            
            [audioPlayer play];
        }
    }

    
}


-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int width = collectionView.frame.size.width / 3;
    return CGSizeMake(width, width);
}

- (NSArray<NSArray<NSNumber *> *> *)moveCoordinates
{
    int cordX = self.lastSelected / self.curGame.board.columnsCount;
    int cordY = self.lastSelected % self.curGame.board.columnsCount;
    
    if (cordY == 0 && cordX == 0)
    {
        cordY = self.lastSelected;
    }
    
    NSArray<NSNumber *> *coordinates = @[@(cordX), @(cordY)];
    return @[coordinates];
}

-(void)draw
{
    [self.collectionView reloadData];
}

-(void)drawGameOver
{
    GameOverViewController* winner = [GameOverViewController gameOverViewControllerWithWinnerName:self.curGame.gameOver];
    winner.modalInPresentation = YES;
    
    [self presentViewController:winner animated:YES completion: ^{
        [self.curGame resetGame];
        [self.collectionView reloadData];
    }];
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

//- (NSArray<NSArray<NSNumber *> *> *)moveCoordinates {
//    NSIndexPath *indexPath;
//}



@end
