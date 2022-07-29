pragma solidity >=0.4.21 <0.7.0;

contract Ownable {
	address public owner;

	constructor () public {
		owner = msg.sender;
	}

	modifier isOwner () {
		require(msg.sender == owner, "Must be an owner");
		_;
	}
}