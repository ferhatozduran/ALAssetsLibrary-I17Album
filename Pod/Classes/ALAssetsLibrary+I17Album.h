//
//  ALAssetsLibrary+I17Album.h
//  Pods
//
//  Created by Ferhat Ozduran on 11/16/14.
//
//

#import <AssetsLibrary/AssetsLibrary.h>

typedef void (^ALAssetsLibraryAddVideoCompletionHandler)(BOOL addToAlbumSuccess, NSError *error);
typedef void (^ALAssetsLibraryAssetsGroupCompletionHandler)(ALAssetsGroup *group, NSError *error);
typedef void (^ALAssetsLibraryAddAssetCompletionHandler)(BOOL success);

@interface ALAssetsLibrary (I17Album)

+ (ALAssetsLibrary *)assetsLibrary;
+ (void)addAlbumWithAlbumName:(NSString *)albumName
            completionHandler:(ALAssetsLibraryAssetsGroupCompletionHandler)completionhandler;
+ (void)findAssetsGroupOfAlbumName:(NSString *)albumName
                 completionHandler:(ALAssetsLibraryAssetsGroupCompletionHandler)completionhandler;
+ (void)addAssetWithAssetURL:(NSURL *)assetURL
                     toGroup:(ALAssetsGroup *)group
           completionHandler:(ALAssetsLibraryAddAssetCompletionHandler)completionHandler;
+ (void)addVideoWithAssetURL:(NSURL *)assetURL
             toAlbumWithName:(NSString *)albumName
           completionHandler:(ALAssetsLibraryAddVideoCompletionHandler)completionhandler;

@end
