//
//  WordDeconstructor.h
//  PigLatin
//
//  Created by Chris Eloranta on 2018-02-17.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CLEWordParser

- (NSMutableArray*)parseNSMutableArray: (NSMutableArray*)parseInput;

@optional

@property NSString *parsingMode;

@end



@interface StringDeconstructor : NSObject


@property BOOL testingMode;
@property (weak) id parserDelegate;

// deconstructs word strings into mutable array, passes array to parser delegate,
// assembles returned parser object into new NSString, and returns

- (NSString*)pigLatinizedWordStringWithWordString:(NSString*)wordInput;

@end

