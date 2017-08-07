//
//  CardMatchingGame.m
//  appCartas
//
//  Created by Marcos JRS on 6/8/17.
//  Copyright © 2017 Marcos JRS. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score; //sobreescribiendo para que sea de escritura tambien
@property (nonatomic, strong) NSMutableArray *cards; //instancias de Card
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(self){
        
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
                card.chosen = NO;
                card.matched = NO;
            } else {
                self = nil;
                break;
            }
        }
        
    }
    
    return self;
}

-(void) reset {
    

}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index]:nil;
}

static const int MISMATCH_PENALTY = 2; // La otra forma sería con un #define . PUntuacion que se pierde si se falla al intentar emparejar
static const int MATCH_BONUS = 4;//Puntuación que gana si empareja correctamente
static const int COST_TO_CHOOSE = 1; //coste se probar la pareja

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    //Si ya está encontrado su pareja, no se podrá seleccionar
    if(!card.isMatched){
        if(card.isChoosen){//si ya estaba seleccionado, lo deseleccionamos
            card.chosen = NO;
        } else {
            //comprobamos si enlaza con otra carta seleccionada
            for(Card * otherCard in self.cards){
                if(otherCard.isChoosen && !otherCard.isMatched){// si está seleccionada y no está enlazada(solucionada) con otra... el método match se le pasaba un array que iteraba para comprobar si alguna tenia el mismo contenido...
                    int matchScore = [card match:@[otherCard]];// al meter el objeto en el array, es totalmente válido.
                    if(matchScore){ //aumentaremos puntos y marcaremos ambas como matcheadas
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO; // resta puntos y deselecciona
                    }
                    //como no vamos a seguir buscando, ya que solo puede haber una seleccionada (choosen), entonces no seguimos en el for...
                    break;
                    
                }
            }
            
            self.score  -= COST_TO_CHOOSE;
            card.chosen = YES ;
        }
    }
    
}

@end


