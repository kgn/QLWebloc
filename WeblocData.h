//
//  WeblocData.h
//  QLWebloc
//
//  Created by David Keegan on 11/26/09.
//  Copyright 2009 InScopeApps{+}. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WeblocData : NSObject {
    NSURL *url;
}

@property (nonatomic, copy) NSURL *url;

- (id)initWithFile:(NSString *)file;
- (NSURL *)getURLFromFile:(NSString *)file;
- (NSData *)html;

@end
