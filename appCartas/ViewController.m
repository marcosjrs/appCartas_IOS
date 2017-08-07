//
//  ViewController.m
//  appCartas
//
//  Created by Marcos JRS on 4/8/17.
//  Copyright © 2017 Marcos JRS. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

-(CardMatchingGame *)game
{
    if(!_game)_game = [ [CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck: [self createDeck]];
    return _game;
}


-(Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}


- (IBAction)resetGame:(id)sender {
    _game = [ [CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck: [self createDeck]];
    [self updateUI];
    
}



- (IBAction)touchCardButton:(UIButton *)sender {
    //recogemos el indice de la carta dentro del array cardButtons
    NSUInteger choseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choseButtonIndex];
    [self updateUI];
}

- (void) updateUI{
    
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card =[self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;// si está "soluccionada" se deshabilita
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    }
    
}

//Si está seleccionada devuelve el contents de la carta, sino ""
-(NSString * ) titleForCard:(Card *) card
{
    return card.isChoosen ? card.contents :@"";
}

//Devuelve "la vuelta" de la carta, según está seleccionada o no.
- (UIImage *) backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChoosen? @"cardfront":@"cardback" ];
}

@end
