//
//  Hashing.swift
//  Tightrope
//
//  Created by Shimaa Hassan on 6/19/18.
//  Copyright © 2018 Shimaa Hassan. All rights reserved.
//

import Foundation
protocol Operator {
    static func <(lhs: Self, rhs: Self) -> Bool
    static func >(lhs: Self, rhs: Self) -> Bool
    static func ==(lhs: Self, rhs: Self) -> Bool
}
extension Int: Operator{}
extension String: Operator{}
extension Node: Operator{
    static func ==(lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs == rhs
    }
    
    static func >(lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs > rhs
    }
    
    static func <(lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs < rhs
    }
}
// convert char to ascii -> int
extension StringProtocol {
    var ascii: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
}
extension Character {
    var ascii: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}


// # ** Binary Tree Class ** #
class Node<T: Operator> {
    var left: Node?
    var right: Node?
    var data: T?
    var id: Int?
    init (data: T, id: Int){
    self.left = nil
    self.right = nil
    self.data = nil
    self.id = nil
    }
    func insert(data: T, id: Int){
//# Compare the new value with the parent node
        if self.data != nil {
        if data < self.data!{
        if self.left == nil{
            self.left = Node(data: data,id: id)}
        else{
            self.left?.insert(data: data,id: id)}}
        else if data > self.data!{
            if self.right == nil{
                self.right = Node(data: data,id: id)}
        else{
                self.right?.insert(data: data,id: id)}}
        else{
            if self.left == nil {
                self.left = Node(data: data,id: id)}
            else{
                self.left?.insert(data: data,id: id)}}}
        else{
        self.data = data
            self.id = id}
        
    }
//# Print the tree from largest element to lowest one
    func PrintTree(){
        if (self.right != nil){
            self.right?.PrintTree()
            print(self.data ?? User(), self.id ?? User())} //TODO:
        if (self.left != nil) {
            self.left?.PrintTree()}
    }
    
    func delete(key: Int) -> Node{
//    """ delete the node with the given key and return the
//    root node of the tree """

    if self.id == key{
//    # found the node we need to delete

        if self.right != nil, self.left != nil{

//    # get the successor node and its parent
            var psucc: Node
            var succ: Node
            if self.right! < self.left! {
                psucc = self
                succ = self.right!
            }else
            {
                psucc = self
                succ = self.left!
            }

//    # splice out the successor
//    # (we need the parent to do this)

            if psucc.left! == succ{
                psucc.left = succ.right}
            else{
                psucc.right = succ.right}

//    # reset the left and right children of the successor

            succ.left = self.left
            succ.right = self.right

            return succ}

    else{
//    # "easier" case
            if (self.left != nil){
                return self.left! // # promote the left subtree

    }
    else{
                return self.right!  //# promote the right subtree

        }}}
    else{
    if key > key{  //# key should be in the left subtree
        if (self.left != nil){
            self.left = self.left?.delete(key: key)}}
 //   # else the key is not in the tree

    else{  //# key should be in the right subtree
        if (self.right != nil){
            self.right = self.right?.delete(key: key)}}}

    return self }
    
//#outer Binary tree traversal func. it takes the searchable data and returns
//# a list of IDs of users sharing this data
 func SearchBT(data: T)-> Array<Int>{
    var found = Array<Int>()
    self.SearchBTin(data: data, found: &found)
    return found }
//#inner func. just to travers tree recursevly
    func SearchBTin (data: T, found: inout Array<Int>){
        if (self.right != nil){
            self.right?.SearchBTin(data: data,  found: &found)}
        if self.data! == data{
            found.append(self.id!)}
        if (self.left != nil){
            self.left?.SearchBTin(data: data, found: &found)}

    }
    
}
//# ** Hash Tables For Fast Searching ** #

//# age binary trees
var ageRoot9 = Node(data: Int(9 / 2) + 1, id: -1)
var ageRoot19 = Node(data: Int(19 / 2) + 1, id: -1)
var ageRoot29 = Node(data: Int(29 / 2) + 1, id: -1)
var ageRoot39 = Node(data: Int(39 / 2) + 1, id: -1)
var ageRoot49 = Node(data: Int(49 / 2) + 1, id: -1)
var ageRoot59 = Node(data: Int(59 / 2) + 1, id: -1)
var ageRoot69 = Node(data: Int(69 / 2) + 1, id: -1)
var ageRoot79 = Node(data: Int(79 / 2) + 1, id: -1)
var ageRoot89 = Node(data: Int(89 / 2) + 1, id: -1)
var ageRoot99 = Node(data: Int(99 / 2) + 1, id: -1)
var ageRoot109 = Node(data: Int(109 / 2) + 1, id: -1)
var ageRoot119 = Node(data: Int(119 / 2) + 1, id: -1)

//# name binary trees
var nameRoot0 = Node(data: "l",id: -1)
var nameRoot1 = Node(data: "m",id: -1)
var nameRoot2 = Node(data: "n",id: -1)
var nameRoot3 = Node(data: "o",id: -1)
var nameRoot4 = Node(data: "p",id: -1)
var nameRoot5 = Node(data: "q",id: -1)
var nameRoot6 = Node(data: "r",id: -1)
var nameRoot7 = Node(data: "s",id: -1)
var nameRoot8 = Node(data: "t",id: -1)
var nameRoot9 = Node(data: "u",id: -1)
var nameRoot10 = Node(data: "v",id: -1)
var nameRoot11 = Node(data: "w",id: -1)

//# country graph
var countryRoot0 = Node(data: "l",id: -1)
var countryRoot1 = Node(data: "m",id: -1)
var countryRoot2 = Node(data: "n",id: -1)
var countryRoot3 = Node(data: "o",id: -1)
var countryRoot4 = Node(data: "p",id: -1)
var countryRoot5 = Node(data: "q",id: -1)
var countryRoot6 = Node(data: "r",id: -1)
var countryRoot7 = Node(data: "s",id: -1)
var countryRoot8 = Node(data: "t",id: -1)
var countryRoot9 = Node(data: "u",id: -1)
var countryRoot10 = Node(data: "v",id: -1)
var countryRoot11 = Node(data: "w",id: -1)

//# ** HashTables functionality ** #
func ageHashFunc(age: Int) -> Int{
if 0 <= age && age <= 9{
    return 9}
else if 10 <= age && age <= 19{
    return 19}
else if 20 <= age && age <= 29{
    return 29}
else if 30 <= age && age <= 39{
    return 39}
else if 40 <= age && age <= 49{
    return 49}
    else if 50 <= age && age <= 59{
        return 59}
    else if 60 <= age && age <= 69{
        return 69}
    else if 70 <= age && age <= 79{
        return 79}
    else if 80 <= age && age <= 89{
        return 89}
    else if 90 <= age && age <= 99{
        return 99}
    else if 100 <= age && age <= 109{
        return 109}
    else{
        return 119}
}

//func addNodeToAgeTree(age: Int, id: Int, personAge: Int){
//if age == 9:
//ageRoot9.insert(personAge, id)
//elif age == 19:
//ageRoot19.insert(personAge, id)
//elif age == 29:
//ageRoot29.insert(personAge, id)
//elif age == 39:
//ageRoot39.insert(personAge, id)
//elif age == 49:
//ageRoot49.insert(personAge, id)
//elif age == 59:
//ageRoot59.insert(personAge, id)
//elif age == 69:
//ageRoot69.insert(personAge, id)
//elif age == 79:
//ageRoot79.insert(personAge, id)
//elif age == 89:
//ageRoot89.insert(personAge, id)
//elif age == 99:
//ageRoot99.insert(personAge, id)
//elif age == 109:
//ageRoot109.insert(personAge, id)
//else:
//ageRoot119.insert(personAge, id)
func nameHashFunc(name: String)-> Int{
var sum = UInt32()
    for char in name{
        sum += char.ascii! * 70}
    return  Int(sum%12)
}

//# Hash Tables For Fast Searching #
var nameTable = [0: nameRoot0, 1: nameRoot1, 2: nameRoot2, 3: nameRoot3, 4: nameRoot4,
    5: nameRoot5, 6: nameRoot6, 7: nameRoot7, 8: nameRoot8, 9: nameRoot9,
    10: nameRoot10, 11: nameRoot11]
var countryTable = [0: countryRoot0, 1: countryRoot1, 2: countryRoot2, 3: countryRoot3,
    4: countryRoot4, 5: countryRoot5, 6: countryRoot6, 7: countryRoot7,
    8: countryRoot8, 9: countryRoot9, 10: countryRoot10, 11: countryRoot11]
var ageTable = [9: ageRoot9, 19: ageRoot19, 29: ageRoot29, 39: ageRoot39,
    49: ageRoot49, 59: ageRoot59, 69: ageRoot69, 79: ageRoot79,
    89: ageRoot89, 99: ageRoot99, 109: ageRoot109, 119: ageRoot119]


//#search func. can search for 3 attributes at max: age, name, country.
//#takes that 3 attributes in any order, but the attribute name must be written before the attibute itself
//#returns a list of users IDs, those users share the same searched attributes

func search<T>(arg1: String, arg1Data: T, arg2: String? = nil, arg2Data: T? = nil, arg3: String? = nil, arg3Data: T? = nil) -> [Int]{
    var found = [Int]()
    if arg1 == "age"{
        let key = ageHashFunc(age: arg1Data as! Int)
        let ID  = ageTable[key]?.SearchBT(data: arg1Data as! Int)
        found = ID!
    }
    else if arg1 == "name"{
        
        let key = nameHashFunc(name: arg1Data as! String)
        let ID  = nameTable[key]?.SearchBT(data: arg1Data as! String)
        found = ID!
        
    }
    else if arg1 == "country"{
        
       let key = nameHashFunc(name: arg1Data as! String)
        let ID  = countryTable[key]?.SearchBT(data: arg1Data as! String)
        found = ID!
        
    }
    if arg2 == "age"{
        let key = ageHashFunc(age: arg2Data as! Int)
        let ID = ageTable[key]?.SearchBT(data: arg2Data as! Int)
        if ID == nil{
            found = []}
        var found2 = [Int]()
        for i in (found){
            for j in ID!{
                
                if i == j{
                    found2.append(i)}}}
        
        found = found2
    }
    else if arg2 == "name"{
        let key = nameHashFunc(name: arg2Data as! String)
        let ID = nameTable[key]?.SearchBT(data: arg2Data as! String)
        if ID == nil{
            found = []}
        var found2 = [Int]()
        for i in (found){
            for j in ID!{
                
                if i == j{
                    
                    found2.append(i)} }}
        
        found = found2}
    else if arg2 == "country"{
        let key = nameHashFunc(name: arg2Data as! String)
        let ID = countryTable[key]?.SearchBT(data: arg2Data as! String)
        if ID == nil{
            found = []}
        var found2 = [Int]()
        for i in (found){
            for j in ID!{
                
                if i == j{
                    found2.append(i)}}}
        
        found = found2
    }
    if arg3 == "age"{
        var key = ageHashFunc(age: arg3Data as! Int)
        var ID = ageTable[key]?.SearchBT(data: arg3Data as! Int)
        if ID == nil{
            found = []
            var found2 = [Int]()
            for i in (found){
                for j in ID!{
                    
                    if i == j{
                        found2.append(i)}}}
            
            found = found2
        }
        else if arg3 == "name"{
            let key = nameHashFunc(name: arg3Data as! String)
            let ID = nameTable[key]?.SearchBT(data: arg3Data as! String)
            if ID == nil{
                found = []}
            var found2 = [Int]()
            for i in (found){
                for j in ID!{
                    
                    if i == j{
                        found2.append(i)}}}
            found = found2}
        else if arg3 == "country"{
            key = nameHashFunc(name: arg3Data as! String)
            ID = countryTable[key]?.SearchBT(data: arg3Data as! String)
            if ID == nil{
                found = []}
            var found2 = [Int]()
            for i in (found){
                for j in ID!{
                    if i == j{
                        found2.append(i)}}}
            found = found2
        }
        return found
    }
    return found
}
//
//'''
//root = Node(10,-1)
//root.insert(5,1)
//root.insert(15,2)
//root.insert(10,0)
//#root.PrintTree()
//ww = ageHashFunc(5)
//addNodeToAgeTree(9,1,5)
//ageRoot9.PrintTree()
//# 0,1,2
//a = nameHashFunc("waleed")
//print(a)
//'''

