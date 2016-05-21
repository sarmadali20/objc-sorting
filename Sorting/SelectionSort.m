//
//  SelectionSort.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/15/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort
-(void) sort {
    
    NSUInteger size = self.sortedArray.count;

    for (NSUInteger i = 0;i<size; i++) {
        NSUInteger min = i;
        for (NSUInteger j = i + 1; j < size; j++) {
            if(self.sortedArray[j].unsignedIntegerValue < self.sortedArray[min].unsignedIntegerValue) {
                min = j;
            }
        }
        
        NSNumber *temp = self.sortedArray[min];
        self.sortedArray[min] = self.sortedArray[i];
        self.sortedArray[i] = temp;
        
        
    }
    
    self.isSorted = YES;
}
@end
