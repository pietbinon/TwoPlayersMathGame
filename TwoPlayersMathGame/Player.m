//
//  Player.m
//  TwoPlayersMathGame
//
//  Created by Pierre Binon on 2017-02-21.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import "Player.h"



@interface Player()


@end




@implementation Player

- (instancetype) initWithName: (NSString *) name{
    self = [super init];
    if (self) {
        _score = 0;
        _lives = 3;
    }
    return self;
}


- (void) loseLife {
    --self.lives;
}

@end
