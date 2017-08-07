//
//  CardMatchingGame.h
//  appCartas
//
//  Created by Marcos JRS on 6/8/17.
//  Copyright © 2017 Marcos JRS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//Inicializador con umero de cartas iniciales y la baraja utilizada
//designated initializer
- (instancetype) initWithCardCount: (NSUInteger) count usingDeck: (Deck *) deck;

//numero de carta seleccionada
-(void) chooseCardAtIndex:(NSUInteger) index;
//carta de un indice
- (Card *) cardAtIndex:(NSUInteger) index;

//puntuacion
@property (nonatomic,readonly) NSInteger score;



@end
