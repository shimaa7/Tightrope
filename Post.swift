//
//  Post.swift
//  Tightrope
//
//  Created by Shimaa Hassan on 6/19/18.
//  Copyright © 2018 Shimaa Hassan. All rights reserved.
//

import Foundation

class Comment{
    var comment_id = 0
    var text: String
    var user_id: Int
    var post_id: Int
//    var time = datetime.now()
    
    init(text: String, user_id: Int, post_id: Int){
    self.text = text
    self.user_id = user_id
    self.post_id = post_id
//    self.time = datetime.now()
//    self.comment_id = Comment.comment_id
    comment_id += 1
    }
    
    func get_text()->String{
        return self.text}
    
    func get_post_id()->Int{
    return self.post_id
    }
    func get_comment_id()-> Int{
    return self.comment_id
    }
//    func get_comment_time(){
//    return self.time
//    }
    func set_comment_id(comment_id: Int){
    self.comment_id = comment_id
    }
    func get_user_id()->Int{
        return self.user_id}
    
    func edit(text: String){
        self.text = text}
}

class Post{
    
    var post_count = 0
    var text: String
    var user_id: Int
    var post_id: Int
//    self.time = str(datetime.now())
    var Comments = [Comment]()
    
    init(text: String, user_id: Int){
    self.text = text
    self.user_id = user_id
    self.post_id = 0
//    self.time = str(datetime.now())
    self.post_count += 1
    }

    
    func get_post_id ()-> Int{
    return self.post_id
    }
    func set_post_id (post_id: Int){
    self.post_id = post_id
    }
    func get_user_id ()-> Int{
    return self.user_id
    }
    func get_text()-> String{
    return self.text
    }
    func edit (text: String){
    self.text = text
    }
//    func get_time(self):
//    return  self.time
    
    func add_comment (text: String, user_id: Int){
//    '''to be done after Soha's task: 30 user scenario'''
//    #if(person.Person.Count < user_id):
//        #   print("not a valid user")
//        #else:
//        #   self.Comments.append(Comment(text, user_id, self.post_id))
        self.Comments.append(Comment(text: text, user_id: user_id, post_id: self.post_id))
    }
        
    func edit_comment(text: String, comment_count: Int){
        self.Comments[comment_count].edit(text: text)
    }
    func delete_comment(comment_count: Int){
         self.Comments.remove(at: comment_count)
    }
    func get_comment_id(text: String)-> Int{
        for i in Comments{
            if i.get_text() == text { return i.comment_id }
        }
        return -1
    }
    func get_comments_num()-> Int{   //  # return local comments number
        return Comments.count
    }
//    func get_comment_time(comment_id){
//        return self.Comments[comment_id].get_comment_time()
//    }
//    func post_view(){
//        var post_contents = "{}\n \n".format(self.text)
//        i = 0
//        for x in self.Comments:
//        post_contents += "     {}- {}: {} \n \n".format(i, x.user_id, x.text)
//        i += 1
//
//        print(post_contents)
//
//    }
    
}



