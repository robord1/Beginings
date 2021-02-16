//
//  Post.swift
//  Beginings
//
//  Created by rob ord on 13/02/2021.
//

import Foundation




class Post {
   
    
    var ownerUsername: String?
    var firstName: String?
    var lastName: String?
    var postId: String?
    var relatedUsers: [RelatedUser]?
    
    var share: Share?
    var save: Save?
    
    
    var isOwner: Bool?
    var hasLiked: Bool?
    var hasBeenShared: Bool?
    var isOwnerRelatedToUser: Bool?
    
    var likePrivacy: Privacy?
    var likeCount: Int?
    var likeUserData: [User]?
    
    var saveCount: Int?
    var saveUserData: [User]?
    
    var shareCount: Int?
    var shareUserData: [User]?
    
    

}
