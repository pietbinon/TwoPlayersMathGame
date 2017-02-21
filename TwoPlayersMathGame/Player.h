//
//  Player.h
//  TwoPlayersMathGame
//
//  Created by Pierre Binon on 2017-02-21.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Player : NSObject

@property NSString *name;
@property int score;
@property int lives;

- (void) loseLife;
- (instancetype) initWithName: (NSString *) name;

@end
