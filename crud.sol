// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0;

contract crud{
    //structure to create student data
    struct User{
        uint id;
        string name;
    }

    //array
    User[] public users;
    uint public nextId = 0;
    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
    }

    function read(uint id) view public returns (uint, string memory){
        for(uint i = 0; i < users.length; i++){
            if(users[i].id == id){
                return (users[i].id, users[i].name);
            }
        }
        revert("User does not exist");
    }

    function Delete(uint id) public {
        delete users[id];
    }

    function find(uint id) view internal returns (uint){
        for(uint i = 0; i < users.length; i++){
            if(users[i].id == id){
                return i;
            }
        }
        revert("Userr does not exist");
    }
}