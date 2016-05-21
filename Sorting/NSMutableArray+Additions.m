//
//  NSMutableArray+Additions.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/14/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "NSMutableArray+Additions.h"

@implementation NSMutableArray (Additions)
-(void)print {
    
    NSLog(@"--- PRINTING ARRAY ---");
    for (NSNumber * number in self) {
        NSLog(@"%lu\n",(unsigned long)number.unsignedIntegerValue);
    }
    NSLog(@"--- PRINTED  ARRAY ---");
}

-(NSArray<NSNumber*>*)minmax{
    
    NSMutableArray* output = [[NSMutableArray alloc] init];
    NSUInteger min = ((NSNumber*)[self objectAtIndex:0]).unsignedIntegerValue;
    NSUInteger max = min;
    for (NSNumber* number in self) {
        NSUInteger temp = number.unsignedIntegerValue;
        
        if(temp < min) {
            min = temp;
        }
        
        if(temp > max) {
            max = temp;
        }
        
    }
    
    [output addObject:[NSNumber numberWithUnsignedInteger:min]];
    [output addObject:[NSNumber numberWithUnsignedInteger:max]];
    
    return output;
    
}

@end
