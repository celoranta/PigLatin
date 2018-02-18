//
//  NSString+PigLatinizer.m
//  PigLatin
//
//  Created by Chris Eloranta on 2018-02-17.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "NSString+PigLatinizer.h"

@implementation NSString (PigLatinizer)

//These are the full phrase parsers exposed in the interface
//

// creates a pig latin phrase from a NSString sentence or phrase and an NSSet of words ending in silent 'e'
- (NSString*)newPigLatinizedStringWithSilentESet:(NSSet*)silentESet
{
    return @"";
}

// creates a pig latin phrase from a NSString sentence or phrase.




// creates a set of words which end with a silent 'e'
- (NSMutableSet*)cleSilentEBank: (NSString*)sourceString;
{
    NSMutableSet *silentEBank = [[NSMutableSet alloc ]init];
    return silentEBank;
}

//
// these methods are internal to this category and are not exposed in the interface
//

// single-word parsers:
//

+ (void)removeApostraphesFromNSMutableArray:(NSMutableArray *)letterArray {
    NSInteger i = 0;
    while(i<[letterArray count])
    {
        NSString *letter = [letterArray objectAtIndex:i];
        if([letter isEqualToString:@"'"])
        {
            [letterArray removeObjectAtIndex:i];
            continue;
        }
        i++;
        
        // test print NSStrings in depunctuated array
        for (NSString *i in letterArray) {NSLog(@"Test print depunctuated array: \n%@",i);}
    }
}

// deconstructs word strings into mutable array, passes array to parser delegate,
// assembles returned parser object into new NSString, and returns

+ (NSString*)initPigLatinizedWordStringWithWordString:(NSString*)wordInput
{
    NSLog(@"Test input to method: %@",wordInput);
    
    
    // create mutable array from input
    NSMutableArray *letterArray = [NSMutableArray array];
    NSString *letters = wordInput;
    
    // parse input into an NSArray of NSStrings
    [letters enumerateSubstringsInRange:NSMakeRange(0, [letters length])
                                options:(NSStringEnumerationByComposedCharacterSequences)
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
                            {
                                 [letterArray addObject:substring];
                             }];
    
    // test print NSStrings in Array
    for (NSString *i in letterArray) {NSLog(@"Test print array: \n%@",i);}
    
    // send to parser
    [self removeApostraphesFromNSMutableArray:letterArray];
    
    // parse array into NSMutable string
    NSString * modifiedString = [[letterArray valueForKey:@"description"] componentsJoinedByString:@""];
    
    // test print modified word as NSMutable string
    NSLog(@"Test print modified NSMutableString: %@",modifiedString);
    
    return modifiedString;
}

// performs pig-latinization on a single NSString word, respecting capitalization and removing internal punctuation

// creation tools for character and word sets
//

// creates a list of words from a string, respecting punctuation, whites
- (NSString*)cleWordParser: (NSString*)sourceString;
{
    return @"";
}

@end
