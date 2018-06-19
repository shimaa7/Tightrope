//
//  Users.swift
//  Tightrope
//
//  Created by Shimaa Hassan on 6/19/18.
//  Copyright © 2018 Shimaa Hassan. All rights reserved.
//

import Foundation

enum relation {
case Friend
case Sibling
case Parent
case Child
case Relative }

extension Person: Operator {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.get_id() == rhs.get_id()
    }
    
    static func >(lhs: Person, rhs: Person) -> Bool {
        return false
    }
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        return false
    }
}
class Users{
//# ** Data ** #
var numUsers = 0  //# Actual number of users in the site
var maxUsers = 0  //# Max number of users in the site we can deal with
var num_posts = 0  //# Actual number of posts in the graph
    var Users = [Person]() //# all users
    var edges = [[Int]]() //# all connection between users
var marks = [Int]()  //# mark user when search about special one
var Posts = [Post]()  //# array of post
//var Groups = []  //# array of groups

//# ** Constructor & Destrcutor ** #
init(maxUsers: Int){ // # set the value of max users
self.maxUsers = maxUsers
//    for row in 0..<self.maxUsers {
//    for col in 0..<self.maxUsers{
//        edges[row][col] = 0
//    }}
//    
    }
    
//# ** Graph functionality ** #
    func MakeEmpty(){  //# delete every thing
self.numUsers = 0
self.maxUsers = 0
 self.Users.removeAll()
 self.edges.removeAll()
 self.marks.removeAll()
}
    func IsEmpty() -> Bool{  //# return true if no users
        return self.numUsers == 0 ? true : false
    }
    func IsFull()-> Bool{ // # return true if limit of users is full
        return self.numUsers == self.maxUsers ? true : false }
    
    func IndexIs(person: Person)-> Int{  //# return index of special user
var i = 0
        for user in self.Users {
            if user == person {
                return i}
                i += 1 }
return -1}
    
    func AddUser(person: Person){  //# add new user
self.Users.append(person)
self.marks.append(0)
        if person.age != nil {
            let ageRange = ageHashFunc(age: person.age!)
            ageTable[ageRange]?.insert(data: person.get_age(),id: person.get_id())}
        
        let nameRange = nameHashFunc(name: person.name)
            nameTable[nameRange]?.insert(data: person.get_name(), id: person.get_id())
        if person.location != nil{
            let countryRange = nameHashFunc(name: person.location!)
            countryTable[countryRange]?.insert(data: person.get_location(), id: person.get_id())}
self.numUsers += 1
    }
    
    func AddEdge(fromPesron: Person, toPerson: Person, weight: Int){  //# add new connection
        let row = self.IndexIs(person: fromPesron)
        let col = self.IndexIs(person: toPerson)
        self.edges[col][row] = weight

//if weight is 3 or weight is relation.Parent:
//self.edges[row][col] = relation.Child
//
//elif weight is 2 or weight is relation.Child:
//self.edges[row][col] = relation.Parent
//
//else:
//self.edges[col][row] = weight #for other relations
    }
    
    func remove_edge(from_person: Person, to_person: Person){ //# remove connection between two users
        let row = self.IndexIs(person: from_person)
        let col = self.IndexIs(person: to_person)
self.edges[row][col] = -1
self.edges[col][row] = -1
    }
    
    func WeightIs(fromPesron: Person, toPerson: Person)-> Int{  //# add weight between two users
        let row = self.IndexIs(person: fromPesron)
        let col = self.IndexIs(person: toPerson)
        return self.edges[row][col]
    }
    
//    func GetToUsers(self, pesron){  //# for searching algorithm
//        print("nothing")}

    func ClearMarks(){ // # delete all marks
        for i in 0..<self.numUsers{
            self.marks[i] = 0}
    }
    
    func MarkUser(pesron: Person){  //# mark user to ignore it in searching
        let index = self.IndexIs(person: pesron)
    self.marks[index] = 1
    }
    
    func IsMarked(pesron: Person)-> Bool{  //# is user marked?
        let index = self.IndexIs(person: pesron)
        return self.marks[index] == 1 ? true : false
    }
    
//# ** searching algorithm ** #
//func DepthFirstSearch(self, startUser, endUser):
//pass
//
//func BreadthFirtsSearch(self, startUser, endUser):
//pass
//
//func bounded_search (self):
//# Search for some one who is not my friend (by email or ID?)
//pass

    func search_by_age(age: Int)->  Node<Int>{
    let key = ageHashFunc(age: age)
        return ageTable[key]!
    }

//# **post** #
    func add_post(post: Post, user_id: Int){
        self.Users[user_id].add_post_id(post_id: self.num_posts)
self.Posts.append(post)
self.num_posts += 1
    }
    
//# post getters
    func get_text(post_id: Int)-> String{
return self.Posts[post_id].get_text()
    }
    
//    func post_view(post_id: Int){
//return self.Posts[post_id].post_view()
//    }
    

    func get_posts_ids(user_id: Int)-> [Int]{
   return self.Users[user_id].get_posts_ids()
    }
// # post view for all the posts of that user >> timeline !
//    func get_posts(user_id: Int)->[Post]{
//print(user_id)
//let posts_ids = self.Users[user_id].get_posts_ids()
//    if posts_ids.count > 0{
//        for i in posts_ids{
//print("post id[", i, "] for user:", user_id)
//            self.Posts[i].post_view()}}
//        else{
//            return "NO posts from user", user_id}
//    }
//
//func show_all_posts(self):
//print("numUsers", self.numUsers)
//for i in range(self.numUsers):
//self.get_posts(i)

////# post setters
//        func set_post_id(post_id: Int){
//            Post.set_Post_id(post_id)
//        }
//        func get_user_id(post_id: Int){
//Post.get_user_id(post_id)
//        }
//func edit_post(self, post_id, text):
//self.Posts[post_id].edit(text)
//
//# comment
//func add_comment (self,text ,post_id, user_id):
//self.Posts[post_id].add_comment(text, user_id)
//
//func edit_comment (self, text, post_id, comment_id):
//self.Posts[post_id].edit_comment(text, comment_id)
//
//func delete_comment (self, post_id, comment_id):
//self.Posts[post_id].delete_comment(comment_id)
//
//func get_comments_num(self, post_id):
//self.Posts[post_id].get_comments_num()
//
//# ** Operation on a group ** #
//func add_relation(self, sender_id, receiver_id, weight=relation.Friend):
//self.Users[sender_id].requests_sent[receiver_id] = weight   # save in sender that he/she sent
//if weight == relation.Parent or weight == 2:
//self.Users[receiver_id].requests_received[sender_id] = relation.Child
//
//elif weight == relation.Child or weight == 3:
//self.Users[receiver_id].requests_received[sender_id] = relation.Parent
//
//else:
//
//self.Users[receiver_id].requests_received[sender_id] = weight
//
//func accept_relation(self, sender_id, receiver_id):
//# check if weight is the same at both
//weight = self.Users[sender_id].requests_sent[receiver_id]   # weight by sender
//self.AddEdge(self.Users[sender_id], self.Users[receiver_id], weight)
//# we need try & except here
//del self.Users[sender_id].requests_sent[receiver_id]
//del self.Users[receiver_id].requests_received[sender_id]
//
//func reject_relation(self, sender_id, receiver_id):
//# we need try & except here
//del self.Users[sender_id].requests_sent[receiver_id]
//del self.Users[receiver_id].requests_received[sender_id]
//
//func remove_relation (self, person_one, person_two):
//self.remove_edge(self.Users[person_one], self.Users[person_two])
//
//func show_sent_requests(self, user_id):
//return self.Users[user_id].requests_sent
//
//func show_received_requests (self, user_id):
//return self.Users[user_id].requests_received
//
//func search_friends(self, user_id, taget_id):
//id_list = list()
//id_list = self.edges[user_id]
//return id_list.index(taget_id)
//
//func show_friends(self, user_id):
//# to be changed later >> when id is more complex function: id_to_index(id = user_id) & vice versa
//id_list = self.edges[user_id]
//count = 0
//friends_list =[]
//# search in adj matrix row for that user_id
//for i in id_list:
//if type(i) == relation or (type(i) == int and i >= 0):
//j = count
//friends_list.append(self.Users[j].get_info())
//count += 1
//friends_number = friends_list.__len__()
//if friends_number > 0:
//if friends_number == 1:
//#  1 friend
//print(friends_number, "friend")
//print(friends_list)
//else:
//#  2 or more friendS
//print(friends_number, "friends")
//print(friends_list)
//else:
//print("No Friends")
//
//func show_friends_posts (self, user_id):
//id_list = self.edges[user_id]
//count = 0
//friends_list = []
//print("Posts from user", user_id, "friends are:")
//# search in adj matrix row for that user_id
//for i in id_list:
//if type(i) == relation or (type(i) == int and i >= 0):
//j = count
//friends_list.append(self.Users[j].get_id())
//count += 1
//friends_number = friends_list.__len__()
//print("friends list:", friends_list)
//printed_posts=[]
//if friends_number > 0:
//for i in friends_list:
//print("from user: ", i)
//print(self.get_posts(i))
//
//else:
//print("this user has no friends")
//
//func show_relation_string(self, id1, id2):
//
//weight = self.edges[id1][id2]
//if weight is 0:
//return "Friends"
//elif weight is 3:
//return "Child"
//elif weight is 2:
//return "Parent"
//elif weight is 4:
//return "Relatives"
//elif weight is 1:
//return "Siblings"
//else:
//return weight
//
//func show_relation_number(self, id1, id2):
//weight = self.edges[id1][id2]
//if weight is 0 or weight is relation.Friend:
//return 0
//elif weight is 3 or weight is relation.Child:
//return 3
//elif weight is 2 or weight is relation.Parent:
//return 2
//elif weight is 4 or weight is relation.Relative:
//return 4
//elif weight is 1 or weight is relation.Sibling:
//return 1
//else:
//return weight
//
//# ** Extract trees and graphs ** #
//'''
//# this code depend on graph on node names
//"""
//graph = {'A': ['B', 'C'],
//'B': ['C', 'D'],
//'C': ['D'],
//'D': ['C'],
//'E': ['F'],
//'F': ['C']}
//"""
//func find_shortest_path(self, start_id, end_id, path=[]):
//path = path + [start_id]
//if start_id == end_id:
//return path
//shortest = None
//for node in range(self.edges[start_id]):
//if node not in path:
//print(self.edges[start_id])
//print(node)
//print()
//newpath = self.find_shortest_path(node, end_id, path)
//if newpath:
//if not shortest or len(newpath) < len(shortest):
//shortest = newpath
//return shortest
//'''
//
//# ** Visualization ** #
//
//func show_graph(self, with_edges=False):
//g = nx.Graph()
//names = {}
//for i in range(self.edges.__len__()):
//
//g.add_node(i)
//for j in range(self.edges.__len__()):
//g.nodes[i]['name'] = self.Users[i].name
//names[i] = self.Users[i].name
//if self.edges[i][j] != -1:
//g.add_edge(i, j)
//g.nodes[j]['name'] = self.Users[j].name
//g[i][j]['w'] = self.show_relation_number(i,j)
//'''parent and child returns 2 & 3 but graph is not directed'''
//
//pos = nx.spring_layout(g)
//nx.draw_networkx_nodes(g, pos)
//nx.draw_networkx_edges(g, pos)
//nx.draw_networkx_labels(g, pos, names)
//if with_edges:
//nx.draw_networkx_edge_labels(g, pos)
//plt.show()
//pass
//
//'''
//func is_sub_list(self, g, l):
//return all(True if x in g else False for x in l)
//
//func show_partial_graph(self, id_list):
//g = nx.Graph()
//names = {}
//for i in range(self.edges.__len__()):
//g.add_node(i)
//for j in range(self.edges.__len__()):
//g.nodes[i]['name'] = self.Users[i].name
//names[i] = self.Users[i].name
//if self.edges[i][j] != -1:
//g.add_edge(i, j)
//g.nodes[j]['name'] = self.Users[j].name
//g[i][j]['w'] = self.show_relation_number(i, j)
//
//
//path_list = [p for p in nx.shortest_path(g, source=id_list[0])]  # Target not specified
//l = id_list[1:]
//res = [x for x in path_list if self.is_sub_list(x, l)]
//return res
//# show the graph
//g = nx.Graph()
//pos = nx.spring_layout(g)
//nx.draw_networkx_nodes(g, pos)
//nx.draw_networkx_edges(g, pos)
//nx.draw_networkx_labels(g, pos, names)
//nx.draw_networkx_edge_labels(g, pos)
//plt.show()
//pass
//'''
}
