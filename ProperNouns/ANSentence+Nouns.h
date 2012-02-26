//
//  ANSentence+Nouns.h
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANSentence.h"
#import "ANProperNoun.h"
#import "NameChecker.h"

@interface ANSentence (Nouns)

- (NSArray *)properNouns:(id<NameChecker>)checker;
- (ANSentence *)sentenceWithProperNouns:(id<NameChecker>)checker;

@end
