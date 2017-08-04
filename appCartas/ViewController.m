//
//  ViewController.m
//  appCartas
//
//  Created by Marcos JRS on 4/8/17.
//  Copyright © 2017 Marcos JRS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    //La idea es el efecto de darle la vuelta cada vez que se toque. Por un lado tendrá el texto de la carta y por el otro no tendrá texto y tendrá el logo. Por tanto para saber si está dado la vuelta podemos mirar si tiene texto o no
    
    if([sender.currentTitle length]){
    //Recuperamos la imagen que le vamos establecer al botón pulsado
    UIImage *cardImage = [UIImage imageNamed:@"cardback"];
    [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
    //Ahora cambiaremos el titulo, ya que antes le dimos la "vuelta"
    [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
        
    }
}


@end
