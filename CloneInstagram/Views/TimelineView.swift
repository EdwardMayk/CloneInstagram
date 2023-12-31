//
//  TimelineView.swift
//  CloneInstagram
//
//  Created by Edward Mayk on 2/12/23.
//

import SwiftUI

struct TimelineView: View {
    let timeline: TimeLineModel
    
    var body: some View {
        VStack{
            headerView
            postImage
            
            actionIcons
            
            commentSection
            
         
            
            
        }
    }
    
    var commentSection : some View{
        HStack{
            Text(timeline.user.username).bold()
            + Text("\(CommentModel.getComments().randomElement()!.comment)")
        }
        .font(.system(size: 13))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
    
    var likeSection: some View{
        HStack{
            Image(UserModel.getUsers().randomElement()!.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 17, height: 17)
                .clipShape(Circle())
            
            Text("Liked by ")
            + Text(UserModel.getUsers().randomElement()!.username).bold()
            + Text(" and ")
            + Text("44,000").bold()
            + Text(" others").bold()
            
        }
        .font(.system(size: 13))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
    
    var actionIcons : some View{
        HStack(spacing:17){
            Button(action:{}){
                    Image("like")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
            Button(action:{}){
                    Image("comment")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
            Button(action:{}){
                    Image("messenger")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
            Spacer()
            Button(action:{}){
                    Image("save")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
    
    var postImage: some View{
        Image(timeline.photo)
            .resizable()
            .frame(height: UIScreen.main.bounds.width)
            .frame(maxWidth: .infinity)
            .aspectRatio(contentMode: .fill)
    }
    
    
    var headerView : some View{
        HStack{
            Image(timeline.user.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2){
                HStack{
                    Text(timeline.user.username)
                        .font(.system(size: 13, weight: .bold))
                    if timeline.user.isVerified{
                        Image("official-icon")
                            .resizable()
                            .frame(width: 10, height: 10)
                    }
                    
                    
                  
                }
                
                Text(timeline.user.city)
                    .font(.system(size: 11))
            }
            
            Spacer()
            Button(action: {}){
                    Image("more-icon")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
}

#Preview {
    TimelineView(timeline: TimeLineModel.getPosts()[0])
}
