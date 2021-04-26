//
//  GameCollectionViewController.h
//  Tic-Tac-Toe
//
//  Created by A-Team Intern on 23.04.21.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameCollectionViewController : UICollectionViewController<InputDelegate, OutputDelegate, UICollectionViewDelegateFlowLayout>

@end

NS_ASSUME_NONNULL_END
