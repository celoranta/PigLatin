//
//  WordParser.m
//  PigLatin
//
//  Created by Chris Eloranta on 2018-02-17.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "WordParser.h"






@implementation WordParser

- (NSMutableArray*)parseNSMutableArray: (NSMutableArray*)parseInput

{
    // create return variable
    NSMutableArray *returnArray;
    
    // set parsing mode equal to the value in the parsingMode property
    NSString* mode = self.parsingMode;
    
    // begin if/else if chain to switch function based on parsingMode
    if ([mode isEqualToString:@"SingleWordToDepostrophedWord"])
    {
        
        returnArray = removeApostraphesFromNSMutableArray(parseInput);
    }
        else if([mode isEqualToString:@"PigLatinize"])
        {
            returnArray = piglatinize(parseInput);
        }
    
    
    // default 'else' statement sends back a message if no recognized string is held in parsingMode property
    else{
        returnArray = makeMutable(@[@"H",@"E",@"L",@"L",@"O",@"_",@"F",@"R",@"O",@"M",@"_",@"T",@"H",@"E",@"_",@"P",@"A",@"R",@"S",@"E",@"R",@"!"]);
    }
    

    
    // return the parsed NSMutableArray
    return returnArray;
}

// returns mutable array for immutable
NSMutableArray *makeMutable (NSArray *immutableArray)
{
    return [NSMutableArray arrayWithArray:immutableArray];
}

// removes apostrophes from NSMutableArray
NSMutableArray* removeApostraphesFromNSMutableArray(NSMutableArray *letterArray) {
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
    }
        // test print NSStrings in depunctuated array
       //  for (NSString *depostrapheIteration in letterArray) {NSLog(@"Test print depostrophed array: \n%@",depostrapheIteration);}
    
    return letterArray;
}

// 'piglatinize' NSMutableArray word
NSMutableArray* piglatinize(NSMutableArray *letterArray) {
    
    //check for capitalization
    //
    //create uppercase characterSet for comparison
    NSCharacterSet* uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    
    //grab NSString from first register of array
    NSString *firstLetterString = [letterArray objectAtIndex:0];
    
    //grab char value of letter
    char firstLetter = [firstLetterString characterAtIndex:0];
    
    //check if uppercase
    BOOL isUppercase = [uppercase characterIsMember:firstLetter];
    

   
    
    //create vowel/consonant hash
    //
    
    //create array for hash which will be reversed due to enumeration direction
    //I was unable to insert into an array pointer at nil, so I initialized with:
    NSArray *vowelConsonantHashArrayImmutable = @[@"x"];
    
    //And then made it mutable
    NSMutableArray *vowelConsonantHashArrayReversed = makeMutable(vowelConsonantHashArrayImmutable);
    
    //create vowel characterset for comparison
    NSCharacterSet *lowerVowelsAndY = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
    
    //iterate through array while
    //inserting 'V' and 'C' strings into new array
    //and forcing to lower case

    int i = 0;
    while(i<[letterArray count])
    {
        NSString * casedLetterString = [letterArray objectAtIndex:i];
        NSString *letterString = [casedLetterString lowercaseString];
        [letterArray replaceObjectAtIndex:i withObject:letterString];
        char letterChar = [letterString characterAtIndex:0];
        BOOL vowel = [lowerVowelsAndY characterIsMember:letterChar];
        if(vowel)
        {
            [vowelConsonantHashArrayReversed insertObject:@"V" atIndex:0];
        }
        else
        {
            [vowelConsonantHashArrayReversed insertObject:@"C" atIndex:0];
        }
        i++;
    }
    
    //reverse the array
    NSMutableArray *vowelConsonantHashArray=[[[vowelConsonantHashArrayReversed reverseObjectEnumerator] allObjects] mutableCopy];
    
    //remove the 'x' used to initialize the array
    [vowelConsonantHashArray removeObjectAtIndex:0];
    
    //NSLog(@"%@",vowelConsonantHashArray);
    
    //Remove any leading 'y'
    //
    
    //sample leading character string
    NSString *currentFirstLetterString = [letterArray objectAtIndex:0];
    
    //if leading string is 'y', delete it, along with corresponding string in hash
    if([currentFirstLetterString isEqualToString:@"y"])
    {
        [letterArray removeObjectAtIndex:0];
        [vowelConsonantHashArray removeObjectAtIndex:0];
    }
    
    //parse into sylables
    //
    
    NSString *currentFirstHashString;
    BOOL startsWithVowel=NO;
    NSInteger currentCount = 0;
    NSString *firstLetterVowelCheck = [vowelConsonantHashArray objectAtIndex:0];
    while([vowelConsonantHashArray count]>0){
    //isolate first letter of hash for check on vowel

    
    //set startsWithVowel value
    startsWithVowel = [firstLetterVowelCheck isEqualToString:@"V"];
        
        if(startsWithVowel) break;
        else
        {
            currentFirstLetterString = [letterArray objectAtIndex:0];
            currentFirstHashString = [vowelConsonantHashArray objectAtIndex:0];
            [letterArray removeObjectAtIndex:0];
            [vowelConsonantHashArray removeObjectAtIndex:0];
            currentCount = [letterArray count];
            [letterArray insertObject:currentFirstLetterString atIndex:currentCount];
            firstLetterVowelCheck = [vowelConsonantHashArray objectAtIndex:0];
        }
    }
    

    [letterArray insertObject:@"a" atIndex:[letterArray count]];
    [letterArray insertObject:@"y" atIndex:[letterArray count]];
    
    if (isUppercase)
    {
        NSString *uncasedLetterString = [letterArray objectAtIndex:0];
        NSString * reCasedLetterString = [uncasedLetterString uppercaseString];
        [letterArray replaceObjectAtIndex:0 withObject:reCasedLetterString];
        
    }
  
    return letterArray;
}
@end
