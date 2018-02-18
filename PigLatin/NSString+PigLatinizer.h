//
//  NSString+PigLatinizer.h
//  PigLatin
//
//  Created by Chris Eloranta on 2018-02-17.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PigLatinizer)

- (NSString*)newPigLatinizedStringWithSilentESet:(NSSet*)silentESet;

+ (NSString*)initPigLatinizedWordStringWithWordString:(NSString*)wordInput;

- (NSSet*)cleSilentEBank: (NSString*)sourceString;

@end
