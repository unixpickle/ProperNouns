//
//  ANSentence.h
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANShortWord.h"
#import "ANPunctuation.h"

@interface ANSentence : NSObject {
    NSArray * words;
}

@property (readonly) NSArray * words;

- (id)initWithWords:(NSArray *)array;

@end
