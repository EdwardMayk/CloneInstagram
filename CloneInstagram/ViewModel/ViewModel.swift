//
//  ViewModel.swift
//  CloneInstagram
//
//  Created by Edward Mayk on 25/11/23.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject{
    @Published var timelineList = [TimeLineModel]()
    @Published var storyList = [StoryModel]()
    
    init(){
        self.timelineList = TimeLineModel.getPosts()
        self.storyList = StoryModel.getStories()
    }
}

