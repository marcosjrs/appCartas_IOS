//
//  Card.h
//  appCartas
//
//  Created by Marcos JRS on 4/8/17.
//  Copyright © 2017 Marcos JRS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

//propiedades
@property (strong, nonatomic) NSString * contents;
@property (nonatomic,getter=isChoosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

//metodos
-(int) match:(Card *)card;

@end
