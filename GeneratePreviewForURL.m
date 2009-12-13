//
//  GeneratePreviewForURL.m
//  QLWebloc
//
//  Created by David Keegan on 11/26/09.
//  Copyright 2009 InScopeApps{+}. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import <CoreServices/CoreServices.h>
#import <QuickLook/QuickLook.h>
#import <Cocoa/Cocoa.h>
#import "WeblocData.h"

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSString *weblocPath = [(NSURL *)url path];
    WeblocData *weblocData = [[WeblocData alloc] initWithFile:weblocPath];
    NSMutableDictionary *properties = [[NSMutableDictionary alloc] init];
    [properties setObject:@"UTF-8" forKey:(NSString *)kQLPreviewPropertyTextEncodingNameKey];
    [properties setObject:@"text/html" forKey:(NSString *)kQLPreviewPropertyMIMETypeKey];
    
    NSData *htmlData = [weblocData html];
    QLPreviewRequestSetDataRepresentation(
        preview, 
        ((CFDataRef)htmlData),
        kUTTypeHTML, 
        (CFDictionaryRef)properties
    ); 
    
    [weblocData release];
    [properties release];
    
    [pool drain];
    return noErr;
}

void CancelPreviewGeneration(void* thisInterface, QLPreviewRequestRef preview){
    // implement only if supported
}
