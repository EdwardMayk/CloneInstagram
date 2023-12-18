//
//  UserModel.swift
//  CloneInstagram
//
//  Created by Edward Mayk on 25/11/23.
//

import Foundation


struct UserModel : Identifiable{
    let id = UUID()
    let username: String
    let profilePicture: String
    let city: String
    let isVerified: Bool
    
    
    static func getUsers() -> [UserModel]{
        return [
            .init(username: "karenname", profilePicture: "person-1", city: "Tokyo, Japon", isVerified: true),
            .init(username: "pablo322", profilePicture: "person-2", city: "Caracas, Venezuela", isVerified: true),
            .init(username: "joshua_1", profilePicture: "person-3", city: "Miami, US", isVerified: false),
            .init(username: "themoon", profilePicture: "person-4", city: "London, UK", isVerified: false),
            .init(username: "hero_232", profilePicture: "person-5", city: "Montreal, Canada", isVerified: true),
            .init(username: "theworld_2", profilePicture: "person-6", city: "New York, US", isVerified: false),
            .init(username: "doggg", profilePicture: "person-7", city: "Beijing, China", isVerified: false),
        ]
    }
}

struct StoryModel: Identifiable{
    let id = UUID()
    let user : UserModel
    let islive: Bool
    
    static func getStories()-> [Self]{
        return UserModel.getUsers().map{ StoryModel(user: $0, islive: ([true, false].randomElement())!)}
    }
}

struct TimeLineModel: Identifiable{
    let id = UUID()
    let photo : String
    let user : UserModel
    
    static func getPosts()-> [Self]{
        return (1..<10).map{TimeLineModel(photo: "post-\($0)", user: UserModel.getUsers().randomElement()!)}
    }
}

struct CommentModel : Identifiable{
    let id = UUID()
    let comment : String
    
    static func getComments() -> [Self]{
        return[
            .init(comment: "Excuse me, folks: Everyone needs to double.tap on this picutre ASAP. its the most beautiful thin you will ever see."),
            .init(comment: "live for the moments you cannot put in words."),
            .init(comment: "so you have been this cool since day one?"),
            .init(comment: "This picutre needs to illustrate the word fun in the dictionary."),
            .init(comment: "this is a perefect example a quality portrait of a quality human being."),
        ]
    }
}
