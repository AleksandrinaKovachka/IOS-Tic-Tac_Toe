//
//  GameCollectionViewController.m
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 23.04.21.
//

#import "GameCollectionViewController.h"
#import "Game.h"
#import "GameCollectionViewCell.h"

@interface GameCollectionViewController ()

@property (strong, nonatomic) Game* game;
@property (assign) int lastSelected;

@end

@implementation GameCollectionViewController

static NSString * const reuseIdentifier = @"GameCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.game = [[Game alloc] initWithPlayerName:@"Pesho" inputDelegate:self andOutputDelegate:self];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9; //TODO
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GameCell" forIndexPath:indexPath];
    
    //NSArray<NSString*>* boardStates = self.game.board.stateDescription;
    NSArray<NSNumber*>* boardStates = self.game.board.stateDescription;
    NSString* imageName;
    
    if (boardStates[indexPath.item].intValue == 0)
    {
        imageName = @"None";
    }
    else if (boardStates[indexPath.item].intValue == 1)
    {
        imageName = @"X";
    }
    else
    {
        imageName = @"O";
    }

    cell.stateImages.image = [UIImage imageNamed:imageName];
    [cell layoutSubviews];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //get coordinate
    self.lastSelected = indexPath.item;
    //GameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GameCell" forIndexPath:indexPath];
    //cell.selected = YES;
    [self.game makeMove];
}


-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int width = collectionView.frame.size.width / 3;
    //int height = collectionView.frame.size.height / 3;
    return CGSizeMake(width, width);
}

- (NSArray<NSArray<NSNumber *> *> *)moveCoordinates
{    
    int cordX = self.lastSelected / self.game.board.columnsCount;
    int cordY = self.lastSelected % self.game.board.columnsCount;
    
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
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Game is over!" message:self.game.gameOver preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}

/*-(void)drawErrorState
{
    self.consoleBoardLabel.text = [@"Not valid input!\n" stringByAppendingString:[NSString stringWithFormat:@"%@", self.game.board]];
}*/


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
