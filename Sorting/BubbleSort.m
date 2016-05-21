//
//  BubbleSort.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/14/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "BubbleSort.h"
#import "NSMutableArray+Additions.h"

@implementation BubbleSort


-(void)sort {
    NSUInteger size = self.sortedArray.count;
    for(NSInteger i = (size-1); i >= 0 ; i--) {
        for(NSUInteger j=1;j<=i;j++) {
            
            if(self.sortedArray[j-1] > self.sortedArray[j]) {
                NSNumber * temp = self.sortedArray[j];
                self.sortedArray[j] = self.sortedArray[j-1];
                self.sortedArray[j-1] = temp;
            
            }
        
        }
    }
    
    self.isSorted = YES;
}



@end