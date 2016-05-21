//
//  main.m
//  Sorting
//
//  Created by Ali, Sarmad on 5/13/16.
//  Copyright © 2016 Pxlim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import "BucketSort.h"
#import "BubbleSort.h"
#import "SelectionSort.h"
#import "InsertionSort.h"
#import "MergeSort.h"
#import "QuickSort.h"
#import "NSMutableArray+Additions.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSUInteger size = 10;
        
        NSLog(@"QUICK SORT START");
        QuickSort *quickSort = [[QuickSort alloc] initWithSize:size];
        [quickSort sort];
        [quickSort printSorted];
        NSLog(@"QUICK SORT END");

        
        NSLog(@"MERGE SORT START");
        MergeSort *mergeSort = [[MergeSort alloc] initWithSize:size];
        [mergeSort sort];
        [mergeSort printSorted];
        NSLog(@"MERGE SORT END");
        
        
        NSLog(@"BUCKET SORT START");
        BucketSort *bucketSort = [[BucketSort alloc] initWithSize:size];
        [bucketSort sort];
        [bucketSort printSorted];
        NSLog(@"BUCKET SORT END");
 
       
        NSLog(@"INSERTION SORT START");
        InsertionSort *insertionSorrt = [[InsertionSort alloc] initWithSize:size];
        [insertionSorrt sort];
        [insertionSorrt printSorted];
        NSLog(@"INSERTION SORT END");
        
        
        NSLog(@"SELECTION SORT START");
        SelectionSort *selectionSort = [[SelectionSort alloc] initWithSize:size];
        [selectionSort sort];
        [selectionSort printSorted];
        NSLog(@"SELECTION SORT END");
        
        NSLog(@"BUBBLE SORT START");
        BubbleSort *bubbleSort = [[BubbleSort alloc] initWithSize:size];
        [bubbleSort sort];
        [bubbleSort printSorted];
        NSLog(@"BUBBLE SORT END");
        
        
       
        
        

    }
    return 0;
}

