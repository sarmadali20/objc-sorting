//
//  Utils.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/13/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(void)fillUsArray:(NSMutableArray*)array withSize:(NSUInteger)size {
    
    for (NSUInteger i=0; i<size; i++) {
        NSUInteger random = arc4random_uniform(1000000);
        [array insertObject:[NSNumber numberWithUnsignedInteger:random] atIndex:i];
    }
}



@end
