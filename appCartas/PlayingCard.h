//
//  PlayingCard.h
//  appCartas
//
//  Hereda de Card, y representa la Carta del juego realmente
//
//  Es un ejemplo de la utilización de synthesize, getters y setters para validaciones y de la utilización de los arrays
//  Created by Marcos JRS on 4/8/17.

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;//el "palo" de la baraja
@property (nonatomic) NSUInteger rank; //Del 0 (sin punto) al 13 (Rey)

+ (NSArray *) validSuits;//validador de palo
+(NSArray *) rankStrings;//figuras de baraja
+(NSUInteger) maxRank;//numero de la figura más alta
@end
