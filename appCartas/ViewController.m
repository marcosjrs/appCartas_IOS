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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount; //Numero de vueltas. Utiliza propiedad, para utilizar el setter para modificar el label...
@property (strong, nonatomic) Deck *deck;

@end

@implementation ViewController

//Instanciación perezosa, mediante un get (pedimos un deck y sino existe lo instancia de PlayingCardDeck)
- (Deck *)deck
{
    if(!_deck) _deck = [self createDeck];
    return _deck;
}

-(Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}


-(void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Giros: %d",self.flipCount]; //utilizamos el getter, por si en algún momento se quisiera controlar...
}

- (IBAction)touchCardButton:(UIButton *)sender {
    //La idea es el efecto de darle la vuelta cada vez que se toque. Por un lado tendrá el texto de la carta y por el otro no tendrá texto y tendrá el logo. Por tanto para saber si está dado la vuelta podemos mirar si tiene texto o no
    
    if([sender.currentTitle length]){
    //Recuperamos la imagen que le vamos establecer al botón pulsado
    UIImage *cardImage = [UIImage imageNamed:@"cardback"];
    [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
    //Ahora cambiaremos el titulo, ya que antes le dimos la "vuelta"
    [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        Card *randomCard = [self.deck drawRandomCard];
        if(randomCard){
            UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        }
        
    }
    
    self.flipCount++; //utilizando el setter
}


@end
