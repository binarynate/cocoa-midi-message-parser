//
//  SDLoggerDelegate.h
//  cocoa-midi-message-parser
//
//  Created by Hill, Nathan on 1/22/17.
//  Copyright © 2017 Hill, Nathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SDLoggerDelegate <NSObject>

- (void) log:(NSString*)string;

@end
