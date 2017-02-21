//
//  GameController.h
//  TwoPlayersMathGame
//
//  Created by Pierre Binon on 2017-02-21.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"



@interface GameController : NSObject

@property int leftValue;
@property int rightValue;
@property int numberPosition;
@property NSString *answer;
@property NSArray *players;

- (NSString *) currentAnswer: (int) number;
- (Player *) curPlayer;
- (void) switchPlayer;
- (NSString *) question;
- (NSString *) score: (int) playerNumber;
- (BOOL) checkAnswer: (NSString *) answer;
- (void) reset;

@end
