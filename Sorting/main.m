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
#import "NSMutableArray+Additions.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSMutableArray<NSNumber*>* usArray =[[NSMutableArray alloc] init];

        [Utils fillUsArray:usArray withSize:10];
        //[usArray print];
        
        /*
        BucketSort *bucketSort = [[BucketSort alloc] init:usArray];
        [bucketSort sort];
        [bucketSort printSorted];
         */
        /*
        BubbleSort *bubbleSort = [[BubbleSort alloc] init:usArray];
        [bubbleSort sort];
        [bubbleSort printSorted];
        */
        
        /*
        SelectionSort *selectionSort = [[SelectionSort alloc] init:usArray];
        [selectionSort sort];
        [selectionSort printSorted];
         */
        
        /*
        InsertionSort *insertionSorrt = [[InsertionSort alloc] init:usArray];
        [insertionSorrt sort];
        [insertionSorrt printSorted];
        */
        
        MergeSort *mergeSort = [[MergeSort alloc] init:usArray];
        [mergeSort sort];
        [mergeSort printSorted];

    }
    return 0;
}

