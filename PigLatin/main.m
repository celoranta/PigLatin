//
//  main.m
//  PigLatin
//
//  Created by Chris Eloranta on 2018-02-16.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatinizer.h"
#import "StringDeconstructor.h"

#import "WordParser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        // set testing mode here
        bool testingMode = NO;
        

        
        
      // prompt the user for a phrase
        NSLog(@"Please enter a phrase... or a 'rasephray, if you will. \n");
        
            // Wait for user response
            char str[100];
            fgets (str, 100, stdin);
            
            // parse phrase into an NSString
            NSString *confirmationInputString = [[NSString alloc] initWithUTF8String:str];
            
            //remove escape symbols and leading/trailing whitespace
            confirmationInputString = [confirmationInputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        //test for user input parser
        if(testingMode) NSLog(@"%@",confirmationInputString);
        
        

        NSString *pigLatinizedPhrase = [NSString CreatePigLatinizedWordStringWithWordString:confirmationInputString];
        
        //test for piglatinization
        if(testingMode) NSLog(@"%@",pigLatinizedPhrase);
        
    }
    return 0;
}
        
        
        
//        //create whitespace character sets for parsing string into arrays by whitespace,
//        //finding the vowels,
//        //and removing the punctuation
//        NSCharacterSet *whiteSpaceSet = [NSCharacterSet whitespaceCharacterSet];
//        NSCharacterSet *vowelCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
//        NSCharacterSet *punctCharactherSet = [NSCharacterSet punctuationCharacterSet];
//
//        // tokenize the phrase into individual words (with punctuation prefixes/suffixes)
//        NSArray *wordArray = [confirmationInputString componentsSeparatedByString:@" "];
//
//        // define a range primitive to hold punctuation lengths and locations
//        NSRange punctRange;
//
//        // define a string object to hold object versions of ranges
//        NSString *punctRangePointer;
//
//        //create a separate array to hold punctuation
//        NSMutableArray *punctArray;
//
//        if(testingMode)  NSLog(@"%lu",[wordArray count]);
//
//        // create an iteration variable
//        int iteration = 0;
//
//        // iterate through the array of words
//        for (NSString* thisWord in wordArray)
//        {
//            //assign word at this index in array to NSString pointer 'thisWord;
//            //thisWord  = [wordArray objectAtIndex:i];
//
//            //find and record any stretches of punctuation in this word as a range
//            punctRange = [thisWord rangeOfCharacterFromSet:punctCharactherSet];
//
//            //encapsulate this range in an NSString object
//            punctRangePointer = NSStringFromRange(punctRange);
//
//            // print it (if in testing mode)
//            if(testingMode) NSLog(@"%@",punctRangePointer);
//
//            //and record them in the punctuation array
//            punctArray[iteration] = (@"%@",punctRangePointer);
//
//            iteration++;
//
//        }
//
//
//
//        // test by logging array
//        if(testingMode == YES) NSLog(@"%@",@"");

        

 



//NSLog(confirmationInputString);

// tokenize the words into individual char arrays
// find the first occurence of a non-leading vowel within each word
// replace each char array with an array of 'chunked' words
// break each word into two words after the first non-leading vowel and place in array of 'chunks'
// reassemble each word

//        - (NSArray<NSString *> *)componentsSeparatedByString:(NSString *)separator;
//        - (NSArray<NSString *> *)componentsSeparatedByCharactersInSet:(NSCharacterSet *)separator API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//        //- (unichar)characterAtIndex:(NSUInteger)index;
//        - (NSString *)substringFromIndex:(NSUInteger)from;
//        - (NSString *)substringToIndex:(NSUInteger)to;
//        - (NSString *)substringWithRange:(NSRange)range;
//        - (void)getCharacters:(unichar *)buffer range:(NSRange)range;   // Use with rangeOfComposedCharacterSequencesForRange: to avoid breaking up character sequences
//        - (BOOL)hasPrefix:(NSString *)str;
//- (BOOL)hasSuffix:(NSString *)str;
//        - (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet;
//        - (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask;
//        - (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch;
//
//        - (NSRange)rangeOfComposedCharacterSequenceAtIndex:(NSUInteger)index;
//        - (NSRange)rangeOfComposedCharacterSequencesForRange:(NSRange)range API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//        - (NSString *)stringByAppendingFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
//        - (void)enumerateSubstringsInRange:(NSRange)range options:(NSStringEnumerationOptions)opts usingBlock:(void (^)(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop))block API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
//        - (nullable const char *)cStringUsingEncoding:(NSStringEncoding)encoding NS_RETURNS_INNER_POINTER;    // "Autoreleased"; NULL return if encoding conversion not possible; for performance reasons, lifetime of this should not be considered longer than the lifetime of the receiving string (if the receiver string is freed, this might go invalid then, before the end of the autorelease scope). Use only with 8-bit encodings, and not encodings such as UTF-16 or UTF-32.
