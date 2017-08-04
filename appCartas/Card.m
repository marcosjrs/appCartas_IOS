//
//  Card.m
//  appCartas
//
//  Created by Marcos JRS on 4/8/17.
//  Copyright © 2017 Marcos JRS. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int) match:(Card *)card{
    int score = 0;//por defecto no es es igual (no matchea)
    
    if([card.contents isEqualToString:self.contents]){
        score=1; // tiene el mismo contenido, por tanto machea.
    }
    
    return score;
}

@end
