//
//  Card.m
//  appCartas
//
//  Created by Marcos JRS on 4/8/17.
//

#import "Card.h"

@implementation Card

-(int) match:(NSArray *)cards{
    int score = 0;//por defecto no es es igual (no matchea)
    
    for (Card * card in cards) {
    
        if([card.contents isEqualToString:self.contents])
        {
            score=1; // tiene el mismo contenido, por   tanto machea.
        }
    }
    
    return score;
}

@end
