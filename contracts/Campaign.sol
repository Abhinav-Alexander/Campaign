pragma solidity ^0.4.17;

contract Campaign{
    struct Request{
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool) 
    }
    
    address public manager;
    mapping(address=>bool) public approvers;
    uint public minContribution;
    Request[] public requests;

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function Campaign(uint minimum) public{
        manager = msg.sender;
        minContribution = minimum;

    }
    function Contribute() public payable {
        require(msg.value > minContribution);

        approvers[msg.sender] = true;
    }
    function CreateRequest(string description, uint value,address recipient) 
        public restricted {
            Request memory newRequest = Request({
                description: description,
                value: value,
                recipient: recipient,
                complete: false
            });
           // Request(description,value,recipient,false) ------other syntax for the same, but the order matters here.
    
            requests.push(newRequest);
            
        }
}