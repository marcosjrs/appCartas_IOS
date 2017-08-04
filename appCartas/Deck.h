//
//  Deck.h
//  appCartas
//
//  Created by Marcos JRS on 4/8/17.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

//propiedades
@property (strong,nonatomic) NSMutableArray * cards;// instancias de Card

//metodos
- (void) addCard:(Card *) card atTop:(BOOL)atTop;//atTop true, si es por arriba, al comienzo del array
- (void) addCard:(Card *) card;
- (Card *)drawRandomCard;



@end
