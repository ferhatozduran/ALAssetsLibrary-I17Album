//
//  ALAssetsLibrary+I17Album.m
//  Pods
//
//  Created by Ferhat Ozduran on 11/16/14.
//
//

#import "ALAssetsLibrary+I17Album.h"



@implementation ALAssetsLibrary (I17Album)

+ (ALAssetsLibrary *)assetsLibrary
{
    static ALAssetsLibrary *assetsLibrary = nil;
    
    if (!assetsLibrary) {
        assetsLibrary = [ALAssetsLibrary new];
    }
    
    return assetsLibrary;
}

+ (void)addAlbumWithAlbumName:(NSString *)albumName
            completionHandler:(ALAssetsLibraryAssetsGroupCompletionHandler)completionhandler
{
    [[self assetsLibrary] addAssetsGroupAlbumWithName:albumName
                                          resultBlock:^(ALAssetsGroup *group) {
                                              completionhandler(group, nil);
                                          }
                                         failureBlock:^(NSError *error) {
                                             completionhandler(nil, error);
                                         }];
}

+ (void)findAssetsGroupOfAlbumName:(NSString *)albumName
                 completionHandler:(ALAssetsLibraryAssetsGroupCompletionHandler)completionhandler
{
    __block BOOL groupFound = NO;
    
    [[self assetsLibrary] enumerateGroupsWithTypes:ALAssetsGroupAlbum
                                        usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                            if ([[group valueForProperty:ALAssetsGroupPropertyName] isEqualToString:albumName]) {
                                                completionhandler(group, nil);
                                                groupFound = YES;
                                                *stop = YES;
                                            }
                                            else if (!group && !groupFound) {
                                                // if "group" is nil that means we reached the end of enumeration.
                                                // The last enumeration with nil group is called even when "*stop = YES" is called earlier.
                                                completionhandler(nil, nil);
                                            }
                                        }
                                      failureBlock:^(NSError* error) {
                                          completionhandler(nil, error);
                                      }];
}

+ (void)addAssetWithAssetURL:(NSURL *)assetURL
                     toGroup:(ALAssetsGroup *)group
           completionHandler:(ALAssetsLibraryAddAssetCompletionHandler)completionHandler
{
    [[self assetsLibrary] assetForURL:assetURL
                          resultBlock:^(ALAsset *asset) {
                              BOOL success = [group addAsset:asset];
                              
                              completionHandler(success);
                          }
                         failureBlock:^(NSError* error) {
                             completionHandler(NO);
                         }];
}

+ (void)addVideoWithAssetURL:(NSURL *)assetURL
             toAlbumWithName:(NSString *)albumName
           completionHandler:(ALAssetsLibraryAddVideoCompletionHandler)completionhandler
{
    [self findAssetsGroupOfAlbumName:albumName
                   completionHandler:^(ALAssetsGroup *group, NSError *error) {
                       if (error) {
                           completionhandler(NO, error);
                           return;
                       }
                       
                       if (group) {
                           [self addAssetWithAssetURL:assetURL
                                              toGroup:group
                                    completionHandler:^(BOOL success) {
                                        completionhandler(success, nil);
                                    }];
                       }
                       else {
                           [self addAlbumWithAlbumName:albumName
                                     completionHandler:^(ALAssetsGroup *groupNew, NSError *error) {
                                         if (error) {
                                             completionhandler(NO, error);
                                             return;
                                         }
                                         
                                         [self addAssetWithAssetURL:assetURL
                                                            toGroup:groupNew
                                                  completionHandler:^(BOOL success) {
                                                      completionhandler(success, nil);
                                                  }];
                                     }];
                       }
                   }];
}

@end
