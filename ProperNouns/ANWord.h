//
//  ANWord.h
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ANWord : NSObject {
    NSString * word;
}

@property (readonly) NSString * word;

- (id)initWithWord:(NSString *)aWord;
- (BOOL)isSignificant;
- (BOOL)isPunctuation;
- (BOOL)isCapitalized;

+ (ANWord *)wordWithString:(NSString *)string;

@end
