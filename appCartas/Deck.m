//
//  Deck.m
//  appCartas
//  Baraja
//  Created by Marcos JRS on 4/8/17.
//

#import "Deck.h"

@implementation Deck


- (Deck *) init{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop){
        [_cards insertObject:card atIndex:0];
    } else {
        [_cards addObject:card];
    }
}

- (void) addCard:(Card *) card{
    [self addCard:card atTop:NO];
}

- (Card *) drawRandomCard{
    Card * randomCard = nil;
    
    if([_cards count]){ //si quedan cartas...
        unsigned index = arc4random() % [self.cards count];//num aleatorio maximo el numero de cartas.
        randomCard = _cards[index];//la devolvemos y la quitamos de la baraja (Deck)
        [_cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
