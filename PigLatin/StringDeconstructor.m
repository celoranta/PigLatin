//
//  WordDeconstructor.m
//  PigLatin
//
//  Created by Chris Eloranta on 2018-02-17.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "StringDeconstructor.h"

@implementation StringDeconstructor

// deconstructs word strings into mutable array, passes array to parser delegate,
// assembles returned parser object into new NSString, and returns

- (NSString*)pigLatinizedWordStringWithWordString:(NSString*)wordInput
{
    NSLog(@"Test input to method: %@",wordInput);
    
    
    // create mutable array from input
    NSMutableArray *letterArray = [NSMutableArray array];
    NSString *letters = wordInput;
    
    // parse input into an NSArray of NSMutableStrings
    [letters enumerateSubstringsInRange:NSMakeRange(0, [letters length])
                                options:(NSStringEnumerationByComposedCharacterSequences)
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         [letterArray addObject:substring];
     }];
    
    // test print NSStrings in Array before sending to parser
    //for (NSString *i in letterArray) {NSLog(@"Test print array before parser: \n%@",i);}
    

    
    // send letterArray to parser and receive parsedArray
    NSMutableArray *parsedArray = [self.parserDelegate parseNSMutableArray:letterArray];
    
    // test print NSStrings in Array after receiving from parser
    // for (NSString *i in parsedArray) {NSLog(@"Test print array after parser: \n%@",i);}
    
    // parse array into string
    NSString * modifiedString = [[parsedArray valueForKey:@"description"] componentsJoinedByString:@""];
    
    // test print modified word as NSMutable string
    NSLog(@"Test print modified NSMutableString: %@",modifiedString);
    
    return modifiedString;
}

@end
