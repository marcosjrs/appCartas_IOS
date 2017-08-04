//
//  PlayingCardDeck.m
//  appCartas
//
//  Created by Marcos JRS on 4/8/17.

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (PlayingCardDeck *)init
{
    self = [super init];
    if (self) {
        //rellenaremos la baraja (deck) con todos los palos válidos y
        //dentro de cada palo, con todas las figuras
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank=1; rank <= [PlayingCard maxRank];rank++)
            {
                PlayingCard * card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card]; //añadimos la nueva carta
            }
        }
        
    }
    return self;
}

@end
