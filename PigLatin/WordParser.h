//
//  WordParser.h
//  PigLatin
//
//  Created by Chris Eloranta on 2018-02-17.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringDeconstructor.h"

@interface WordParser : NSObject <CLEWordParser>

@property BOOL testingMode;
@property NSString* parsingMode;

- (NSMutableArray*)parseNSMutableArray: (NSMutableArray*)parseInput;



@end
