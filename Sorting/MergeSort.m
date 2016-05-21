//
//  MergeSort.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/20/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import "MergeSort.h"
#import "NSMutableArray+Additions.h"
@implementation MergeSort
@synthesize temp,mergeCount,mergeSortCount;

-(void) sort {
    
    NSUInteger size = self.sortedArray.count;
    temp = malloc(sizeof(NSUInteger)*size);
    mergeSortCount = 0;
    mergeCount = 0;
    
    [self mergeSort:0 andHigh:size-1];
    
    self.isSorted = YES;
    
    free(self.temp);
   
    
}

-(void) mergeSort:(NSUInteger)low andHigh:(NSUInteger)high {
    
   
    if(low < high) {
        
    
        NSUInteger mid = (low+high)/2;
        self.mergeSortCount++;
        NSLog(@"mergeSort = %d, low = %lu , mid=%lu , high=%lu",mergeSortCount,low,mid,high);
        // Left half
        [self mergeSort:low andHigh:mid];
        // Right half
        [self mergeSort:mid+1 andHigh:high];
        
        // Merge every thing
        [self merge:low andMid:mid andHigh:high];
        
    }

    
}

-(void) merge:(NSUInteger)low andMid:(NSUInteger)mid andHigh:(NSUInteger)high {
    
    self.mergeCount++;
    NSLog(@"merge = %d, low = %lu , mid=%lu , high=%lu",self.mergeCount,low,mid,high);

    
    NSUInteger i = low,j=mid+1,index = low,k;
    
    while (i<=mid && j<= high) {
        if(self.sortedArray[i].unsignedIntegerValue <= self.sortedArray[j].unsignedIntegerValue) {
            self.temp[index] = self.sortedArray[i].unsignedIntegerValue;
            i++;
        } else {
            self.temp[index] = self.sortedArray[j].unsignedIntegerValue;
            j++;
        }
        index++;
    }
    
    if(i>mid) {
        
        for (k=j; k<=high; k++) {
            self.temp[index] = self.sortedArray[k].unsignedIntegerValue;
            index++;
        }
        
    } else {
        
        for(k=i;k<=mid;k++)  {
            self.temp[index] = self.sortedArray[k].unsignedIntegerValue;
            index++;
        }
    }
    
    for (NSUInteger k=low; k<=high; k++) {
        self.sortedArray[k] = [NSNumber numberWithUnsignedInteger:self.temp[k]];
    }
}


@end
