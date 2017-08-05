//
//  PlayingCard.m
//  appCartas
//
//  Hereda de Card
//  Created by Marcos JRS on 4/8/17.

#import "PlayingCard.h"

@implementation PlayingCard


//getter/setter del palo de la baraja
@synthesize suit = _suit; //Como queremos añadir un getter/setter especifico, tenemos que utililizar el @synthesize

-(NSString *) suit{ //Otra forma de asegurarse el valor, sin hacerlo en el init....
    return _suit ? _suit : @"?";
}

-(void) setSuit:(NSString *)suit{
    //Comprobamos que el palo que se quiera añadir sea válido
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
    
}

//seteo de la figura de la carta
-(void)setRank:(NSUInteger)rank{
    //Comprobamos que el palo sea válido
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

//Metodo (sobreescrito) que devuelve el contenido de la carta. Devolverá un string, numero de carta (o figura J, Q, K...) + palo
- (NSString * ) contents{
    NSArray * figuras = [PlayingCard rankStrings];
    return [figuras[_rank] stringByAppendingString:self.suit];
    
}


//Método de clase que devuelve los palos válidos
+ (NSArray *) validSuits{
    return @[@"♣︎",@"♥︎",@"♦︎",@"♠︎"];
}

//Método de clase que devuelve las figuras de la baraja
+(NSArray *) rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", @"J",@"Q",@"K"];
}

//Método de clase que devuelve el numero de la figura más alta
+(NSUInteger) maxRank{
    return [[PlayingCard rankStrings] count] - 1;
}












@end
