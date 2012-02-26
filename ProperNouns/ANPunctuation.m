//
//  ANPunctuation.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANPunctuation.h"

@implementation ANPunctuation

+ (BOOL)isPunctuationCharacter:(unichar)aChar {
    return (strchr(".;,", aChar) != NULL);
}

- (BOOL)isPunctuation {
    return YES;
}

@end
