//
//  NSString+PigLatinizer.m
//  PigLatin
//
//  Created by Chris Eloranta on 2018-02-17.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "NSString+PigLatinizer.h"

@implementation NSString (PigLatinizer)


+ (NSString*)CreatePigLatinizedWordStringWithWordString:(NSString*)wordInput
{
    //create deconstructor
    StringDeconstructor *myDeconstructor = [[StringDeconstructor alloc]init];
    
    //create parser
    WordParser *myWordParser = [[WordParser alloc]init];
    
    //set parser as deconstructor delegate
    myDeconstructor.parserDelegate = myWordParser;
    
//    //set parsing mode
//    myWordParser.parsingMode = @"PhraseChop";
//
//    //send NSString to deconstructor for relay to parser
//    NSString *parsedString0 = [myDeconstructor pigLatinizedWordStringWithWordString:wordInput];
    
    //set parser mode to remove apostrophes
    myWordParser.parsingMode = @"SingleWordToDepostrophedWord";
    
    //send NSString to deconstructor for relay to parser
    NSString *parsedString1 = [myDeconstructor pigLatinizedWordStringWithWordString:wordInput];
    
    //set parsing mode
    myWordParser.parsingMode = @"PigLatinize";
    
    //send NSString to deconstructor for relay to parser
    NSString *parsedString2 = [myDeconstructor pigLatinizedWordStringWithWordString:parsedString1];
    

    return parsedString2;
    
}

//testing Mode Setter Method

//These are the full phrase parsers exposed in the interface
//

//
// these methods are internal to this category and are not exposed in the interface
//

// single-word parsers:
//





//// deconstructs word strings into mutable array, passes array to parser delegate,
//// assembles returned parser object into new NSString, and returns
//
//+ (NSString*)initPigLatinizedWordStringWithWordString:(NSString*)wordInput
//{
//    NSLog(@"Test input to method: %@",wordInput);
//
//



// performs pig-latinization on a single NSString word, respecting capitalization and removing internal punctuation

// creation tools for character and word sets
//

//// creates a list of words from a string, respecting punctuation, whites
//- (NSString*)cleWordParser: (NSString*)sourceString;
//{
//    return @"";
//}

@end
