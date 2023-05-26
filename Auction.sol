// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.4.0 < 0.9.0;

contract Auction {
    mapping(address => uint)  biddersData;
    uint highestBidderAMount;
    address highestBidderAdrrees; 
    address owner;
    uint startTime = block.timestamp;
    uint endTime;

    //use epochconverter.com for timing

    bool auctionEnded = false;
    
            constructor(){
                owner = msg.sender;
            }


     

    //how to put new bid;
        function putBid() public payable{


    uint calculateAmount = biddersData[msg.sender] + msg.value;


    
            require(auctionEnded == true, "Auction has ended");
            require(block.timestamp > endTime, "Auction has ended");
            require(msg.value > 0, "Bid Amount should not be zero");


    //to check highest bid..........
                    
            require(msg.value > highestBidderAMount, "Bid counnot be lower than highest bidder");
 
            biddersData[msg.sender] = calculateAmount;
            highestBidderAMount = calculateAmount; 
            highestBidderAdrrees = msg.sender;
        }

    //getting contract balance
        //  function getContractBalance() public view returns(uint){
        //         return address(this).balance; 
        // }

         //getting specific contract balance
         function getBidderBid(address _address) public view returns(uint){
                return biddersData[_address]; 
        }


    //getting Hihest bidAmount

    function HighestBid() public view returns(uint){
        return highestBidderAMount;

    }

    // get Highest Bidder Address
    
    function HighestBidder() public view returns(address){
     return  highestBidderAdrrees;

    }

    //end tme of function

    function putEndTime (uint _endTime) public {
        endTime = _endTime;
        auctionEnded = true;
    }

    //to withdraw bids  

    function withdrawBid(address payable _address) public {
       if(biddersData[_address] > 0){
           _address.transfer(biddersData[_address]);

       }

    }


}

    
