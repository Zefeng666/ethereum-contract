pragma solidity ^0.4.17;

contract Project {
    struct Payment {
        string description;
        unit amount;
        address receiver;
        bool completed;
        address[] voters;
    }

    address public owner;
    string public description;
    unit public minInvest;
    unit public maxInvest;
    unit public goal;
    address[] public investors;
    Payment[] public payments;

    constructor(string _description, unit _minInvest, uint _maxInvest, unit _goal) public {
        owner = msg.sender;
        description = _description;
        minInvest = _minInvest;
        maxInvest = _maxInvest;
        goal = _goal;
    }

    function contribute() public payable {
        require(msg.value >= minInvest);
        require(msg.value <= maxInvest);
        require(address(this).balance <= goal);

        investors.push(msg.sender);
    }

    function createPayment(string _description, unit _amount, address _receiver) public {
        Payment menory newPayment = Payment({
            description: _description,
            amount: _amount,
            receiver: _receiver,
            completed: false,
            voters: new address[](0)
        });

        payments.push(newPayment)
    }
}