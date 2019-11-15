// Asset Transfer - Azure Blockchain Workbench Sample
//
// This sample is a business use case where an asset is offered for sale.
// An offer may be made, and that offer can be accepted or rejected.  Once
// accepted, the asset needs to be appraised and inspected after which the
// asset is transferred and payment is accepted.
//
// The source is at https://github.com/Azure-Samples/blockchain/tree/master/blockchain-workbench/application-and-smart-contract-samples/asset-transfer
//
// Azure Blockchain Workbench also requires a .json file that describes the
// roles, states, state transitions, and what roles can make the state transitions.
// In this way, the smart contract workflow is described in the .json file and the solidity 
// code executes its functionality

// the pragma declares the version of the solidity compiler used in this code
pragma solidity >=0.4.25 <0.6.0;

//
//    The smart contract is named according to the name you've provided here, in this case it's "AssetTransfer"
//
contract AssetTransfer
{
    // StateTypes are the states the AssetTransfer smart contract can be in.  These are also reflected in the AssetTransfer.json
    // The contract data is persisted in the instance of the smart contract
    enum StateType { Active, OfferPlaced, PendingInspection, Inspected, Appraised, NotionalAcceptance, BuyerAccepted, SellerAccepted, Accepted, Terminated }
    address public InstanceOwner;
    string public Description;
    uint public AskingPrice;
    StateType public State;

    address public InstanceBuyer;
    uint public OfferPrice;
    address public InstanceInspector;
    address public InstanceAppraiser;

    // The constructor is run when the smart contractor is initially created
    constructor(string memory description, uint256 price) public
    {
        InstanceOwner = msg.sender;
        AskingPrice = price;
        Description = description;
        State = StateType.Active;
    }

    // terminates the smart contract, no more code will execute against it
    function Terminate() public
    {
        if (InstanceOwner != msg.sender)
        {
            revert();
        }

        State = StateType.Terminated;
    }

    // modify the description of the asset and its price
    function Modify(string memory description, uint256 price) public
    {
        if (State != StateType.Active)
        {
            revert();
        }
        if (InstanceOwner != msg.sender)
        {
            revert();
        }

        Description = description;
        AskingPrice = price;
    }

    // An offer is made on the asset, and we have to check that it hasn't
    // already been inspected or appraised
    function MakeOffer(address inspector, address appraiser, uint256 offerPrice) public
    {
        if (inspector == 0x0000000000000000000000000000000000000000 || appraiser == 0x0000000000000000000000000000000000000000 || offerPrice == 0)
        {
            revert();
        }
        if (State != StateType.Active)
        {
            revert();
        }
        // Cannot enforce "AllowedRoles":["Buyer"] because Role information is unavailable
        if (InstanceOwner == msg.sender) // not expressible in the current specification language
        {
            revert();
        }

        InstanceBuyer = msg.sender;
        InstanceInspector = inspector;
        InstanceAppraiser = appraiser;
        OfferPrice = offerPrice;
        State = StateType.OfferPlaced;
    }

    // the offer has been accepted
    function AcceptOffer() public
    {
        if (State != StateType.OfferPlaced)
        {
            revert();
        }
        if (InstanceOwner != msg.sender)
        {
            revert();
        }

        State = StateType.PendingInspection;
    }

    // the offer has been rejected
    function Reject() public
    {
        if (State != StateType.OfferPlaced && State != StateType.PendingInspection && State != StateType.Inspected && State != StateType.Appraised && State != StateType.NotionalAcceptance && State != StateType.BuyerAccepted)
        {
            revert();
        }
        if (InstanceOwner != msg.sender)
        {
            revert();
        }

        InstanceBuyer = 0x0000000000000000000000000000000000000000;
        State = StateType.Active;
    }

    function Accept() public
    {
        if (msg.sender != InstanceBuyer && msg.sender != InstanceOwner)
        {
            revert();
        }

        if (msg.sender == InstanceOwner &&
            State != StateType.NotionalAcceptance &&
            State != StateType.BuyerAccepted)
        {
            revert();
        }

        if (msg.sender == InstanceBuyer &&
            State != StateType.NotionalAcceptance &&
            State != StateType.SellerAccepted)
        {
            revert();
        }

        if (msg.sender == InstanceBuyer)
        {
            if (State == StateType.NotionalAcceptance)
            {
                State = StateType.BuyerAccepted;
            }
            else if (State == StateType.SellerAccepted)
            {
                State = StateType.Accepted;
            }
        }
        else
        {
            if (State == StateType.NotionalAcceptance)
            {
                State = StateType.SellerAccepted;
            }
            else if (State == StateType.BuyerAccepted)
            {
                State = StateType.Accepted;
            }
        }
    }

    // the offer has been modified
    function ModifyOffer(uint256 offerPrice) public
    {
        if (State != StateType.OfferPlaced)
        {
            revert();
        }
        if (InstanceBuyer != msg.sender || offerPrice == 0)
        {
            revert();
        }

        OfferPrice = offerPrice;
    }

    // the offer was rescinded by the potential buyer
    function RescindOffer() public
    {
        if (State != StateType.OfferPlaced && State != StateType.PendingInspection && State != StateType.Inspected && State != StateType.Appraised && State != StateType.NotionalAcceptance && State != StateType.SellerAccepted)
        {
            revert();
        }
        if (InstanceBuyer != msg.sender)
        {
            revert();
        }

        InstanceBuyer = 0x0000000000000000000000000000000000000000;
        OfferPrice = 0;
        State = StateType.Active;
    }

    // the asset has been appraised
    function MarkAppraised() public
    {
        if (InstanceAppraiser != msg.sender)
        {
            revert();
        }

        if (State == StateType.PendingInspection)
        {
            State = StateType.Appraised;
        }
        else if (State == StateType.Inspected)
        {
            State = StateType.NotionalAcceptance;
        }
        else
        {
            revert();
        }
    }

    // the asset has been accepted
    function MarkInspected() public
    {
        if (InstanceInspector != msg.sender)
        {
            revert();
        }

        if (State == StateType.PendingInspection)
        {
            State = StateType.Inspected;
        }
        else if (State == StateType.Appraised)
        {
            State = StateType.NotionalAcceptance;
        }
        else
        {
            revert();
        }
    }
}