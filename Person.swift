//
//  Person.swift
//  Tightrope
//
//  Created by Shimaa Hassan on 6/19/18.
//  Copyright © 2018 Shimaa Hassan. All rights reserved.
//

import Foundation

class Person{
    //    # ** Data ** ##
//    """
//    dict = {
//    "ID": [],  # generated
//    "Name": [],  # Just user name not sir name
//    "Email": [],  # Normal Email
//    "Password": []  # four digits password = 10^4 users
//    }
//    """
//    var next = nil
    var ID = 0
    var name: String
    var email: String
    var password: String
    var age: Int
    var location: String
    var gender: String
    var groups = [Int]()
    var posts = [Int]()
    var admin = [Int]()
    var requests_sent = [Int]()
    var requests_received = [Int]()
    var Count = 0
    
    //    # ** Constructor & Destructor **##
    init(name: String, email: String, password: String, age: Int? = nil, location: String? = nil, gender: String? = nil){
    self.ID = self.Count
    self.name = name
    self.email = email
    self.password = password
        self.age = age!
        self.location = location!
    self.gender = gender!
    self.Count += 1
    }
//    # ** Getters and Setters **##
    
    func get_id() -> Int{
        return self.ID}
    
    func get_name()-> String{
        return self.name}
    
    func get_email()-> String{
        return self.email}
    
    func get_password()->String{
        return self.password}
    
    func get_age()-> Int{
        return self.age}
    
    func get_location()-> String{
        return self.location}
    
    func get_gender()-> String{
        return self.gender}
    
    func get_posts_ids()-> [Int]{
        return self.posts}
    
    func get_groups_ids ()-> [Int]{
    return self.groups
    }
    func get_admin_groups ()-> [Int]{
        return self.admin}
//    # ** getters and setters for person's whole information **##
    
//    func get_info(){
//        return self.__dict__}
    
//    # ** setters for persons information **#
    func set_id(ID: Int){
    self.ID = ID
    }
    func set_name(name: String){
        let oldName = nameHashFunc(name: self.name)
        nameTable[oldName]?.delete(key: self.get_id())
    self.name = name
        let newName = nameHashFunc(name: self.name)
        nameTable[newName]?.insert(data: self.name,id: self.get_id())
    }
    func set_email(email: String){
        self.email = email}
    
    func set_password(password: String){
        self.password = password}
    
    func set_age(age: Int){
        let oldAge = ageHashFunc(age: self.age)
        ageTable[oldAge]?.delete(key: self.get_id())
    self.age = age
        let newAge = ageHashFunc(age: self.age)
        ageTable[newAge]?.insert(data: self.age,id: self.get_id())}
    
    func set_location(location: String){
        let oldLocation = nameHashFunc(name: self.location)
        countryTable[oldLocation]?.delete(key: self.get_id())
    self.location = location
        let newLocation = nameHashFunc(name: self.location)
        countryTable[newLocation]?.insert(data: self.location,id: self.get_id())}
    
    func set_gender(gender: String){
        self.gender = gender}
    
    func set_info(id: Int? = nil, name: String? = nil, email: String? = nil, password: String? = nil){
    if id != nil{
        self.set_id(ID: id!)}
        if name != nil{
            self.set_name(name: name!)}
        if email != nil{
            self.set_email(email: email!)}
        if password != nil{
            self.set_password(password: password!)}}
    
//    # ** adding posts or groups **##
    func add_post_id(post_id: Int){
        self.posts.append(post_id)}
    
    func add_group_id(group_id: Int){
        self.groups.append(group_id)}
    
    func add_admin_group(group_id: Int){
        self.admin.append(group_id)}
    
    func add_friend_request(user_id: Int, weight: Int){
    self.requests_received[user_id] = weight
    
//    # when a user is declared Admin, he will be declared here and in groups class or its equivilant
    }
//    # ** removing posts or groups **##
    func remove_post(post_id: Int){
        self.posts.remove(at: post_id)}
    
    func remove_group(group_id: Int){
        self.groups.remove(at: group_id)}
    
    func remove_admin_group(group_id: Int){
        self.admin.remove(at: group_id)}
    
}

