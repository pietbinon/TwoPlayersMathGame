//
//  ViewController.m
//  TwoPlayersMathGame
//
//  Created by Pierre Binon on 2017-02-21.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import "ViewController.h"
#import "GameController.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1Lives;
@property (weak, nonatomic) IBOutlet UILabel *player2Lives;
@property (weak, nonatomic) IBOutlet UILabel *fadingLabel;
@property NSString *answer;
@property GameController *gameController;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _answer = @"";
    _gameController = [GameController new];
    self.questionLabel.text = [self.gameController question];
    self.player1Score.text = [self.gameController score:0];
    self.player2Score.text = [self.gameController score:1];
    self.player1Lives.text = @"Player1 lives: 3";
    self.player2Lives.text = @"Player2 lives: 3";
    self.answerLabel.text = @"";
}

-(IBAction)button:(id)sender{
    self.answer = [self.answer stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)[sender tag]]];
    self.answerLabel.text = self.answer;
}

- (IBAction)buttonEnter:(id)sender {
    [self enter];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)enter{
    Player *player = [self.gameController curPlayer];
    if ([self.gameController checkAnswer:self.answer]){
        self.fadingLabel.text = @"CORRECT!";
        self.fadingLabel.backgroundColor = [UIColor greenColor];
        ++player.score;
        [self fade];
        
    }
    else {
        self.fadingLabel.text = @"WRONG!";
        self.fadingLabel.backgroundColor = [UIColor redColor];
        --player.lives;
        [self fade];
    }
    [self.gameController switchPlayer];
    self.answer = @"";
    [self update];
    self.questionLabel.text = [self.gameController question];
}

-(void)update{
    Player *player1 = [self.gameController.players objectAtIndex:0];
    Player *player2 = [self.gameController.players objectAtIndex:1];
    self.player1Score.text = [@"Player1 score: " stringByAppendingString:[NSString stringWithFormat:@"%d",player1.score]];
    self.player2Score.text = [@"Player2 score: " stringByAppendingString:[NSString stringWithFormat:@"%d",player2.score]];
    self.player1Lives.text = [@"Player1 lives: " stringByAppendingString:[NSString stringWithFormat:@"%d",player1.lives]];
    self.player2Lives.text = [@"Player2 lives: " stringByAppendingString:[NSString stringWithFormat:@"%d",player2.lives]];
    if (player1.lives == 0){
        self.answerLabel.text = @"GAME OVER, player2 wins!";
        [self gameOver];
        
    }
    else if (player2.lives == 0){
        self.answerLabel.text = @"GAME OVER, player1 wins!";
        [self gameOver];
        
    }
    
}

-(void)gameOver{
    [self.gameController reset];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"GAME OVER"
                                                                   message:@"Play again?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    [self update];
    
}

-(void)fade{
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:  ^{[self.fadingLabel setAlpha:1.f];}
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1
                                               delay:0
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{[self.fadingLabel setAlpha:0.f];}
                                          completion:nil];}];
}


@end
