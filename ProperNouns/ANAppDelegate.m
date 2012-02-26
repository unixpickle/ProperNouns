//
//  ANAppDelegate.m
//  ProperNouns
//
//  Created by Alex Nichol on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANAppDelegate.h"

@implementation ANAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSString * file = [[NSBundle mainBundle] pathForResource:@"dictionary" ofType:@"txt"];
    WordDictionary * dictionary = [[WordDictionary alloc] initWithFile:file];
    
    ANParagraph * p = [[ANParagraph alloc] initWithString:@"This American Life host and producer Ira Glass is among our era’s most beloved storytellers. In this wonderful short motion graphics piece, filmmaker David Shiyang Liu has captured Glass’s now-legendary interview on the art of storytelling in beautifully minimalist and elegant kinetic typography. The gist of Glass’s message for beginners — that grit is what separates mere good taste from great work, and that the only way to bridge the gap between ability and ambition is to actually do the work — is one that rings true for just about every creative discipline, and something I can certainly speak to in my own experience."];
    
    ANParagraph * p2 = [p paragraphWithProperNouns:dictionary];
    NSLog(@"%@", [p2 stringValue]);
}

@end
