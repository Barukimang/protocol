// File: contracts/arbitration/IArbitrator.sol
// Omitted -- see AragonProtocol

// File: contracts/arbitration/IArbitrable.sol
// Omitted -- see AragonProtocol

// File: contracts/core/clock/IClock.sol
// Omitted -- see AragonProtocol

// File: contracts/core/clock/ProtocolClock.sol
// Omitted -- see AragonProtocol

// File: contracts/core/config/IConfig.sol
// Omitted -- see AragonProtocol

// File: contracts/core/config/ProtocolConfigData.sol
// Omitted -- see AragonProtocol

// File: contracts/core/config/ProtocolConfig.sol
// Omitted -- see AragonProtocol

// File: contracts/core/modules/ACL.sol
// Omitted -- see AragonProtocol

// File: contracts/core/modules/Controller.sol
// Omitted -- see AragonProtocol

// File: contracts/core/config/ConfigConsumer.sol
// Omitted -- see AragonProtocol

// File: contracts/lib/standards/IERC20.sol

/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.5.17;


/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);

    function balanceOf(address _who) external view returns (uint256);

    function allowance(address _owner, address _spender) external view returns (uint256);

    function transfer(address _to, uint256 _value) external returns (bool);

    function approve(address _spender, uint256 _value) external returns (bool);

    function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
}

// File: contracts/lib/math/SafeMath.sol

// Brought from https://github.com/aragon/aragonOS/blob/v4.3.0/contracts/lib/math/SafeMath.sol
// Adapted to use pragma ^0.5.17 and satisfy our linter rules

pragma solidity >=0.4.24 <0.6.0;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error
 */
library SafeMath {
    string private constant ERROR_ADD_OVERFLOW = "MATH_ADD_OVERFLOW";
    string private constant ERROR_SUB_UNDERFLOW = "MATH_SUB_UNDERFLOW";
    string private constant ERROR_MUL_OVERFLOW = "MATH_MUL_OVERFLOW";
    string private constant ERROR_DIV_ZERO = "MATH_DIV_ZERO";

    /**
    * @dev Multiplies two numbers, reverts on overflow.
    */
    function mul(uint256 _a, uint256 _b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (_a == 0) {
            return 0;
        }

        uint256 c = _a * _b;
        require(c / _a == _b, ERROR_MUL_OVERFLOW);

        return c;
    }

    /**
    * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 _a, uint256 _b) internal pure returns (uint256) {
        require(_b > 0, ERROR_DIV_ZERO); // Solidity only automatically asserts when dividing by 0
        uint256 c = _a / _b;
        // assert(_a == _b * c + _a % _b); // There is no case in which this doesn't hold

        return c;
    }

    /**
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 _a, uint256 _b) internal pure returns (uint256) {
        require(_b <= _a, ERROR_SUB_UNDERFLOW);
        uint256 c = _a - _b;

        return c;
    }

    /**
    * @dev Adds two numbers, reverts on overflow.
    */
    function add(uint256 _a, uint256 _b) internal pure returns (uint256) {
        uint256 c = _a + _b;
        require(c >= _a, ERROR_ADD_OVERFLOW);

        return c;
    }

    /**
    * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, ERROR_DIV_ZERO);
        return a % b;
    }
}

// File: contracts/lib/math/SafeMath64.sol

// Brought from https://github.com/aragon/aragonOS/blob/v4.3.0/contracts/lib/math/SafeMath64.sol
// Adapted to use pragma ^0.5.17 and satisfy our linter rules

pragma solidity ^0.5.17;


/**
 * @title SafeMath64
 * @dev Math operations for uint64 with safety checks that revert on error
 */
library SafeMath64 {
    string private constant ERROR_ADD_OVERFLOW = "MATH64_ADD_OVERFLOW";
    string private constant ERROR_SUB_UNDERFLOW = "MATH64_SUB_UNDERFLOW";
    string private constant ERROR_MUL_OVERFLOW = "MATH64_MUL_OVERFLOW";
    string private constant ERROR_DIV_ZERO = "MATH64_DIV_ZERO";

    /**
    * @dev Multiplies two numbers, reverts on overflow.
    */
    function mul(uint64 _a, uint64 _b) internal pure returns (uint64) {
        uint256 c = uint256(_a) * uint256(_b);
        require(c < 0x010000000000000000, ERROR_MUL_OVERFLOW); // 2**64 (less gas this way)

        return uint64(c);
    }

    /**
    * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
    */
    function div(uint64 _a, uint64 _b) internal pure returns (uint64) {
        require(_b > 0, ERROR_DIV_ZERO); // Solidity only automatically asserts when dividing by 0
        uint64 c = _a / _b;
        // assert(_a == _b * c + _a % _b); // There is no case in which this doesn't hold

        return c;
    }

    /**
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint64 _a, uint64 _b) internal pure returns (uint64) {
        require(_b <= _a, ERROR_SUB_UNDERFLOW);
        uint64 c = _a - _b;

        return c;
    }

    /**
    * @dev Adds two numbers, reverts on overflow.
    */
    function add(uint64 _a, uint64 _b) internal pure returns (uint64) {
        uint64 c = _a + _b;
        require(c >= _a, ERROR_ADD_OVERFLOW);

        return c;
    }

    /**
    * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint64 a, uint64 b) internal pure returns (uint64) {
        require(b != 0, ERROR_DIV_ZERO);
        return a % b;
    }
}

// File: contracts/lib/utils/SafeERC20.sol

// Brought from https://github.com/aragon/aragonOS/blob/v4.3.0/contracts/common/SafeERC20.sol
// Adapted to use pragma ^0.5.17 and satisfy our linter rules

pragma solidity ^0.5.17;



library SafeERC20 {
    /**
    * @dev Same as a standards-compliant ERC20.transfer() that never reverts (returns false).
    *      Note that this makes an external call to the provided token and expects it to be already
    *      verified as a contract.
    */
    function safeTransfer(IERC20 _token, address _to, uint256 _amount) internal returns (bool) {
        bytes memory transferCallData = abi.encodeWithSelector(
            _token.transfer.selector,
            _to,
            _amount
        );
        return invokeAndCheckSuccess(address(_token), transferCallData);
    }

    /**
    * @dev Same as a standards-compliant ERC20.transferFrom() that never reverts (returns false).
    *      Note that this makes an external call to the provided token and expects it to be already
    *      verified as a contract.
    */
    function safeTransferFrom(IERC20 _token, address _from, address _to, uint256 _amount) internal returns (bool) {
        bytes memory transferFromCallData = abi.encodeWithSelector(
            _token.transferFrom.selector,
            _from,
            _to,
            _amount
        );
        return invokeAndCheckSuccess(address(_token), transferFromCallData);
    }

    /**
    * @dev Same as a standards-compliant ERC20.approve() that never reverts (returns false).
    *      Note that this makes an external call to the provided token and expects it to be already
    *      verified as a contract.
    */
    function safeApprove(IERC20 _token, address _spender, uint256 _amount) internal returns (bool) {
        bytes memory approveCallData = abi.encodeWithSelector(
            _token.approve.selector,
            _spender,
            _amount
        );
        return invokeAndCheckSuccess(address(_token), approveCallData);
    }

    function invokeAndCheckSuccess(address _addr, bytes memory _calldata) private returns (bool) {
        bool ret;
        assembly {
            let ptr := mload(0x40)    // free memory pointer

            let success := call(
                gas,                  // forward all gas
                _addr,                // address
                0,                    // no value
                add(_calldata, 0x20), // calldata start
                mload(_calldata),     // calldata length
                ptr,                  // write output over free memory
                0x20                  // uint256 return
            )

            if gt(success, 0) {
            // Check number of bytes returned from last function call
                switch returndatasize

                // No bytes returned: assume success
                case 0 {
                    ret := 1
                }

                // 32 bytes returned: check if non-zero
                case 0x20 {
                // Only return success if returned data was true
                // Already have output in ptr
                    ret := eq(mload(ptr), 1)
                }

                // Not sure what was returned: don't mark as success
                default { }
            }
        }
        return ret;
    }
}

// File: contracts/lib/utils/Uint256Helpers.sol

// Brought from https://github.com/aragon/aragonOS/blob/v4.3.0/contracts/common/Uint256Helpers.sol
// Adapted to use pragma ^0.5.17 and satisfy our linter rules

pragma solidity ^0.5.17;


library Uint256Helpers {
    uint256 private constant MAX_UINT8 = uint8(-1);
    uint256 private constant MAX_UINT64 = uint64(-1);

    string private constant ERROR_UINT8_NUMBER_TOO_BIG = "UINT8_NUMBER_TOO_BIG";
    string private constant ERROR_UINT64_NUMBER_TOO_BIG = "UINT64_NUMBER_TOO_BIG";

    function toUint8(uint256 a) internal pure returns (uint8) {
        require(a <= MAX_UINT8, ERROR_UINT8_NUMBER_TOO_BIG);
        return uint8(a);
    }

    function toUint64(uint256 a) internal pure returns (uint64) {
        require(a <= MAX_UINT64, ERROR_UINT64_NUMBER_TOO_BIG);
        return uint64(a);
    }
}

// File: contracts/lib/utils/TimeHelpers.sol

// Brought from https://github.com/aragon/aragonOS/blob/v4.3.0/contracts/common/TimeHelpers.sol
// Adapted to use pragma ^0.5.17 and satisfy our linter rules

pragma solidity ^0.5.17;



contract TimeHelpers {
    using Uint256Helpers for uint256;

    /**
    * @dev Returns the current block number.
    *      Using a function rather than `block.number` allows us to easily mock the block number in
    *      tests.
    */
    function getBlockNumber() internal view returns (uint256) {
        return block.number;
    }

    /**
    * @dev Returns the current block number, converted to uint64.
    *      Using a function rather than `block.number` allows us to easily mock the block number in
    *      tests.
    */
    function getBlockNumber64() internal view returns (uint64) {
        return getBlockNumber().toUint64();
    }

    /**
    * @dev Returns the current timestamp.
    *      Using a function rather than `block.timestamp` allows us to easily mock it in
    *      tests.
    */
    function getTimestamp() internal view returns (uint256) {
        return block.timestamp; // solium-disable-line security/no-block-members
    }

    /**
    * @dev Returns the current timestamp, converted to uint64.
    *      Using a function rather than `block.timestamp` allows us to easily mock it in
    *      tests.
    */
    function getTimestamp64() internal view returns (uint64) {
        return getTimestamp().toUint64();
    }
}

// File: contracts/payments/IPaymentsBook.sol

/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.5.17;


interface IPaymentsBook {
    /**
    * @dev Pay an amount of tokens
    * @param _token Address of the token being paid
    * @param _amount Amount of tokens being paid
    * @param _payer Address paying on behalf of
    * @param _data Optional data
    */
    function pay(address _token, uint256 _amount, address _payer, bytes calldata _data) external payable;
}

// File: contracts/lib/utils/PctHelpers.sol

pragma solidity ^0.5.17;



library PctHelpers {
    using SafeMath for uint256;

    uint256 internal constant PCT_BASE = 10000; // ‱ (1 / 10,000)

    function isValid(uint16 _pct) internal pure returns (bool) {
        return _pct <= PCT_BASE;
    }

    function pct(uint256 self, uint16 _pct) internal pure returns (uint256) {
        return self.mul(uint256(_pct)) / PCT_BASE;
    }

    function pct256(uint256 self, uint256 _pct) internal pure returns (uint256) {
        return self.mul(_pct) / PCT_BASE;
    }

    function pctIncrease(uint256 self, uint16 _pct) internal pure returns (uint256) {
        // No need for SafeMath: for addition note that `PCT_BASE` is lower than (2^256 - 2^16)
        return self.mul(PCT_BASE + uint256(_pct)) / PCT_BASE;
    }
}

// File: contracts/registry/IGuardiansRegistry.sol

/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.5.17;



interface IGuardiansRegistry {

    /**
    * @dev Assign a requested amount of guardian tokens to a guardian
    * @param _guardian Guardian to add an amount of tokens to
    * @param _amount Amount of tokens to be added to the available balance of a guardian
    */
    function assignTokens(address _guardian, uint256 _amount) external;

    /**
    * @dev Burn a requested amount of guardian tokens
    * @param _amount Amount of tokens to be burned
    */
    function burnTokens(uint256 _amount) external;

    /**
    * @dev Draft a set of guardians based on given requirements for a term id
    * @param _params Array containing draft requirements:
    *        0. bytes32 Term randomness
    *        1. uint256 Dispute id
    *        2. uint64  Current term id
    *        3. uint256 Number of seats already filled
    *        4. uint256 Number of seats left to be filled
    *        5. uint64  Number of guardians required for the draft
    *        6. uint16  Permyriad of the minimum active balance to be locked for the draft
    *
    * @return guardians List of guardians selected for the draft
    * @return length Size of the list of the draft result
    */
    function draft(uint256[7] calldata _params) external returns (address[] memory guardians, uint256 length);

    /**
    * @dev Slash a set of guardians based on their votes compared to the winning ruling
    * @param _termId Current term id
    * @param _guardians List of guardian addresses to be slashed
    * @param _lockedAmounts List of amounts locked for each corresponding guardian that will be either slashed or returned
    * @param _rewardedGuardians List of booleans to tell whether a guardian's active balance has to be slashed or not
    * @return Total amount of slashed tokens
    */
    function slashOrUnlock(uint64 _termId, address[] calldata _guardians, uint256[] calldata _lockedAmounts, bool[] calldata _rewardedGuardians)
        external
        returns (uint256 collectedTokens);

    /**
    * @dev Try to collect a certain amount of tokens from a guardian for the next term
    * @param _guardian Guardian to collect the tokens from
    * @param _amount Amount of tokens to be collected from the given guardian and for the requested term id
    * @param _termId Current term id
    * @return True if the guardian has enough unlocked tokens to be collected for the requested term, false otherwise
    */
    function collectTokens(address _guardian, uint256 _amount, uint64 _termId) external returns (bool);

    /**
    * @dev Lock a guardian's withdrawals until a certain term ID
    * @param _guardian Address of the guardian to be locked
    * @param _termId Term ID until which the guardian's withdrawals will be locked
    */
    function lockWithdrawals(address _guardian, uint64 _termId) external;

    /**
    * @dev Tell the active balance of a guardian for a given term id
    * @param _guardian Address of the guardian querying the active balance of
    * @param _termId Term ID querying the active balance for
    * @return Amount of active tokens for guardian in the requested past term id
    */
    function activeBalanceOfAt(address _guardian, uint64 _termId) external view returns (uint256);

    /**
    * @dev Tell the total amount of active guardian tokens at the given term id
    * @param _termId Term ID querying the total active balance for
    * @return Total amount of active guardian tokens at the given term id
    */
    function totalActiveBalanceAt(uint64 _termId) external view returns (uint256);
}

// File: contracts/lib/utils/IsContract.sol

// Brought from https://github.com/aragon/aragonOS/blob/v4.3.0/contracts/common/IsContract.sol
// Adapted to use pragma ^0.5.17 and satisfy our linter rules

pragma solidity ^0.5.17;


contract IsContract {
    /*
    * NOTE: this should NEVER be used for authentication
    * (see pitfalls: https://github.com/fergarrui/ethereum-security/tree/master/contracts/extcodesize).
    *
    * This is only intended to be used as a sanity check that an address is actually a contract,
    * RATHER THAN an address not being a contract.
    */
    function isContract(address _target) internal view returns (bool) {
        if (_target == address(0)) {
            return false;
        }

        uint256 size;
        assembly { size := extcodesize(_target) }
        return size > 0;
    }
}

// File: contracts/core/modules/ModuleIds.sol

pragma solidity ^0.5.17;


contract ModuleIds {
    // DisputeManager module ID - keccak256(abi.encodePacked("DISPUTE_MANAGER"))
    bytes32 internal constant MODULE_ID_DISPUTE_MANAGER = 0x14a6c70f0f6d449c014c7bbc9e68e31e79e8474fb03b7194df83109a2d888ae6;

    // GuardiansRegistry module ID - keccak256(abi.encodePacked("GUARDIANS_REGISTRY"))
    bytes32 internal constant MODULE_ID_GUARDIANS_REGISTRY = 0x8af7b7118de65da3b974a3fd4b0c702b66442f74b9dff6eaed1037254c0b79fe;

    // Voting module ID - keccak256(abi.encodePacked("VOTING"))
    bytes32 internal constant MODULE_ID_VOTING = 0x7cbb12e82a6d63ff16fe43977f43e3e2b247ecd4e62c0e340da8800a48c67346;

    // PaymentsBook module ID - keccak256(abi.encodePacked("PAYMENTS_BOOK"))
    bytes32 internal constant MODULE_ID_PAYMENTS_BOOK = 0xfa275b1417437a2a2ea8e91e9fe73c28eaf0a28532a250541da5ac0d1892b418;

    // Treasury module ID - keccak256(abi.encodePacked("TREASURY"))
    bytes32 internal constant MODULE_ID_TREASURY = 0x06aa03964db1f7257357ef09714a5f0ca3633723df419e97015e0c7a3e83edb7;
}

// File: contracts/core/modules/IModulesLinker.sol

pragma solidity ^0.5.17;


interface IModulesLinker {
    /**
    * @notice Update the implementations of a list of modules
    * @param _ids List of IDs of the modules to be updated
    * @param _addresses List of module addresses to be updated
    */
    function linkModules(bytes32[] calldata _ids, address[] calldata _addresses) external;
}

// File: contracts/voting/ICRVotingOwner.sol

/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.5.17;


interface ICRVotingOwner {
    /**
    * @dev Ensure votes can be committed for a vote instance, revert otherwise
    * @param _voteId ID of the vote instance to request the weight of a voter for
    */
    function ensureCanCommit(uint256 _voteId) external;

    /**
    * @dev Ensure a certain voter can commit votes for a vote instance, revert otherwise
    * @param _voteId ID of the vote instance to request the weight of a voter for
    * @param _voter Address of the voter querying the weight of
    */
    function ensureCanCommit(uint256 _voteId, address _voter) external;

    /**
    * @dev Ensure a certain voter can reveal votes for vote instance, revert otherwise
    * @param _voteId ID of the vote instance to request the weight of a voter for
    * @param _voter Address of the voter querying the weight of
    * @return Weight of the requested guardian for the requested vote instance
    */
    function ensureCanReveal(uint256 _voteId, address _voter) external returns (uint64);
}

// File: contracts/voting/ICRVoting.sol

/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.5.17;



interface ICRVoting {
    /**
    * @dev Create a new vote instance
    * @dev This function can only be called by the CRVoting owner
    * @param _voteId ID of the new vote instance to be created
    * @param _possibleOutcomes Number of possible outcomes for the new vote instance to be created
    */
    function createVote(uint256 _voteId, uint8 _possibleOutcomes) external;

    /**
    * @dev Get the winning outcome of a vote instance
    * @param _voteId ID of the vote instance querying the winning outcome of
    * @return Winning outcome of the given vote instance or refused in case it's missing
    */
    function getWinningOutcome(uint256 _voteId) external view returns (uint8);

    /**
    * @dev Get the tally of an outcome for a certain vote instance
    * @param _voteId ID of the vote instance querying the tally of
    * @param _outcome Outcome querying the tally of
    * @return Tally of the outcome being queried for the given vote instance
    */
    function getOutcomeTally(uint256 _voteId, uint8 _outcome) external view returns (uint256);

    /**
    * @dev Tell whether an outcome is valid for a given vote instance or not
    * @param _voteId ID of the vote instance to check the outcome of
    * @param _outcome Outcome to check if valid or not
    * @return True if the given outcome is valid for the requested vote instance, false otherwise
    */
    function isValidOutcome(uint256 _voteId, uint8 _outcome) external view returns (bool);

    /**
    * @dev Get the outcome voted by a voter for a certain vote instance
    * @param _voteId ID of the vote instance querying the outcome of
    * @param _voter Address of the voter querying the outcome of
    * @return Outcome of the voter for the given vote instance
    */
    function getVoterOutcome(uint256 _voteId, address _voter) external view returns (uint8);

    /**
    * @dev Tell whether a voter voted in favor of a certain outcome in a vote instance or not
    * @param _voteId ID of the vote instance to query if a voter voted in favor of a certain outcome
    * @param _outcome Outcome to query if the given voter voted in favor of
    * @param _voter Address of the voter to query if voted in favor of the given outcome
    * @return True if the given voter voted in favor of the given outcome, false otherwise
    */
    function hasVotedInFavorOf(uint256 _voteId, uint8 _outcome, address _voter) external view returns (bool);

    /**
    * @dev Filter a list of voters based on whether they voted in favor of a certain outcome in a vote instance or not
    * @param _voteId ID of the vote instance to be checked
    * @param _outcome Outcome to filter the list of voters of
    * @param _voters List of addresses of the voters to be filtered
    * @return List of results to tell whether a voter voted in favor of the given outcome or not
    */
    function getVotersInFavorOf(uint256 _voteId, uint8 _outcome, address[] calldata _voters) external view returns (bool[] memory);
}

// File: contracts/treasury/ITreasury.sol

/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.5.17;



interface ITreasury {
    /**
    * @dev Assign a certain amount of tokens to an account
    * @param _token ERC20 token to be assigned
    * @param _to Address of the recipient that will be assigned the tokens to
    * @param _amount Amount of tokens to be assigned to the recipient
    */
    function assign(IERC20 _token, address _to, uint256 _amount) external;

    /**
    * @dev Withdraw a certain amount of tokens
    * @param _token ERC20 token to be withdrawn
    * @param _from Address withdrawing the tokens from
    * @param _to Address of the recipient that will receive the tokens
    * @param _amount Amount of tokens to be withdrawn from the sender
    */
    function withdraw(IERC20 _token, address _from, address _to, uint256 _amount) external;
}

// File: contracts/disputes/IDisputeManager.sol

pragma solidity ^0.5.17;




interface IDisputeManager {
    enum DisputeState {
        PreDraft,
        Adjudicating,
        Ruled
    }

    enum AdjudicationState {
        Invalid,
        Committing,
        Revealing,
        Appealing,
        ConfirmingAppeal,
        Ended
    }

    /**
    * @dev Create a dispute to be drafted in a future term
    * @param _subject Arbitrable instance creating the dispute
    * @param _possibleRulings Number of possible rulings allowed for the drafted guardians to vote on the dispute
    * @param _metadata Optional metadata that can be used to provide additional information on the dispute to be created
    * @return Dispute identification number
    */
    function createDispute(IArbitrable _subject, uint8 _possibleRulings, bytes calldata _metadata) external returns (uint256);

    /**
    * @dev Submit evidence for a dispute
    * @param _subject Arbitrable instance submitting the dispute
    * @param _disputeId Identification number of the dispute receiving new evidence
    * @param _submitter Address of the account submitting the evidence
    * @param _evidence Data submitted for the evidence of the dispute
    */
    function submitEvidence(IArbitrable _subject, uint256 _disputeId, address _submitter, bytes calldata _evidence) external;

    /**
    * @dev Close the evidence period of a dispute
    * @param _subject IArbitrable instance requesting to close the evidence submission period
    * @param _disputeId Identification number of the dispute to close its evidence submitting period
    */
    function closeEvidencePeriod(IArbitrable _subject, uint256 _disputeId) external;

    /**
    * @dev Draft guardians for the next round of a dispute
    * @param _disputeId Identification number of the dispute to be drafted
    */
    function draft(uint256 _disputeId) external;

    /**
    * @dev Appeal round of a dispute in favor of a certain ruling
    * @param _disputeId Identification number of the dispute being appealed
    * @param _roundId Identification number of the dispute round being appealed
    * @param _ruling Ruling appealing a dispute round in favor of
    */
    function createAppeal(uint256 _disputeId, uint256 _roundId, uint8 _ruling) external;

    /**
    * @dev Confirm appeal for a round of a dispute in favor of a ruling
    * @param _disputeId Identification number of the dispute confirming an appeal of
    * @param _roundId Identification number of the dispute round confirming an appeal of
    * @param _ruling Ruling being confirmed against a dispute round appeal
    */
    function confirmAppeal(uint256 _disputeId, uint256 _roundId, uint8 _ruling) external;

    /**
    * @dev Compute the final ruling for a dispute
    * @param _disputeId Identification number of the dispute to compute its final ruling
    * @return subject Arbitrable instance associated to the dispute
    * @return finalRuling Final ruling decided for the given dispute
    */
    function computeRuling(uint256 _disputeId) external returns (IArbitrable subject, uint8 finalRuling);

    /**
    * @dev Settle penalties for a round of a dispute
    * @param _disputeId Identification number of the dispute to settle penalties for
    * @param _roundId Identification number of the dispute round to settle penalties for
    * @param _guardiansToSettle Maximum number of guardians to be slashed in this call
    */
    function settlePenalties(uint256 _disputeId, uint256 _roundId, uint256 _guardiansToSettle) external;

    /**
    * @dev Claim rewards for a round of a dispute for guardian
    * @dev For regular rounds, it will only reward winning guardians
    * @param _disputeId Identification number of the dispute to settle rewards for
    * @param _roundId Identification number of the dispute round to settle rewards for
    * @param _guardian Address of the guardian to settle their rewards
    */
    function settleReward(uint256 _disputeId, uint256 _roundId, address _guardian) external;

    /**
    * @dev Settle appeal deposits for a round of a dispute
    * @param _disputeId Identification number of the dispute to settle appeal deposits for
    * @param _roundId Identification number of the dispute round to settle appeal deposits for
    */
    function settleAppealDeposit(uint256 _disputeId, uint256 _roundId) external;

    /**
    * @dev Tell the amount of token fees required to create a dispute
    * @return feeToken ERC20 token used for the fees
    * @return feeAmount Total amount of fees to be paid for a dispute at the given term
    */
    function getDisputeFees() external view returns (IERC20 feeToken, uint256 feeAmount);

    /**
    * @dev Tell information of a certain dispute
    * @param _disputeId Identification number of the dispute being queried
    * @return subject Arbitrable subject being disputed
    * @return possibleRulings Number of possible rulings allowed for the drafted guardians to vote on the dispute
    * @return state Current state of the dispute being queried: pre-draft, adjudicating, or ruled
    * @return finalRuling The winning ruling in case the dispute is finished
    * @return lastRoundId Identification number of the last round created for the dispute
    * @return createTermId Identification number of the term when the dispute was created
    */
    function getDispute(uint256 _disputeId) external view
        returns (IArbitrable subject, uint8 possibleRulings, DisputeState state, uint8 finalRuling, uint256 lastRoundId, uint64 createTermId);

    /**
    * @dev Tell information of a certain adjudication round
    * @param _disputeId Identification number of the dispute being queried
    * @param _roundId Identification number of the round being queried
    * @return draftTerm Term from which the requested round can be drafted
    * @return delayedTerms Number of terms the given round was delayed based on its requested draft term id
    * @return guardiansNumber Number of guardians requested for the round
    * @return selectedGuardians Number of guardians already selected for the requested round
    * @return settledPenalties Whether or not penalties have been settled for the requested round
    * @return collectedTokens Amount of guardian tokens that were collected from slashed guardians for the requested round
    * @return coherentGuardians Number of guardians that voted in favor of the final ruling in the requested round
    * @return state Adjudication state of the requested round
    */
    function getRound(uint256 _disputeId, uint256 _roundId) external view
        returns (
            uint64 draftTerm,
            uint64 delayedTerms,
            uint64 guardiansNumber,
            uint64 selectedGuardians,
            uint256 guardianFees,
            bool settledPenalties,
            uint256 collectedTokens,
            uint64 coherentGuardians,
            AdjudicationState state
        );

    /**
    * @dev Tell appeal-related information of a certain adjudication round
    * @param _disputeId Identification number of the dispute being queried
    * @param _roundId Identification number of the round being queried
    * @return maker Address of the account appealing the given round
    * @return appealedRuling Ruling confirmed by the appealer of the given round
    * @return taker Address of the account confirming the appeal of the given round
    * @return opposedRuling Ruling confirmed by the appeal taker of the given round
    */
    function getAppeal(uint256 _disputeId, uint256 _roundId) external view
        returns (address maker, uint64 appealedRuling, address taker, uint64 opposedRuling);

    /**
    * @dev Tell information related to the next round due to an appeal of a certain round given.
    * @param _disputeId Identification number of the dispute being queried
    * @param _roundId Identification number of the round requesting the appeal details of
    * @return nextRoundStartTerm Term ID from which the next round will start
    * @return nextRoundGuardiansNumber Guardians number for the next round
    * @return newDisputeState New state for the dispute associated to the given round after the appeal
    * @return feeToken ERC20 token used for the next round fees
    * @return guardianFees Total amount of fees to be distributed between the winning guardians of the next round
    * @return totalFees Total amount of fees for a regular round at the given term
    * @return appealDeposit Amount to be deposit of fees for a regular round at the given term
    * @return confirmAppealDeposit Total amount of fees for a regular round at the given term
    */
    function getNextRoundDetails(uint256 _disputeId, uint256 _roundId) external view
        returns (
            uint64 nextRoundStartTerm,
            uint64 nextRoundGuardiansNumber,
            DisputeState newDisputeState,
            IERC20 feeToken,
            uint256 totalFees,
            uint256 guardianFees,
            uint256 appealDeposit,
            uint256 confirmAppealDeposit
        );

    /**
    * @dev Tell guardian-related information of a certain adjudication round
    * @param _disputeId Identification number of the dispute being queried
    * @param _roundId Identification number of the round being queried
    * @param _guardian Address of the guardian being queried
    * @return weight Guardian weight drafted for the requested round
    * @return rewarded Whether or not the given guardian was rewarded based on the requested round
    */
    function getGuardian(uint256 _disputeId, uint256 _roundId, address _guardian) external view returns (uint64 weight, bool rewarded);
}

// File: contracts/core/modules/Controlled.sol

pragma solidity ^0.5.17;













contract Controlled is IModulesLinker, IsContract, ModuleIds, ConfigConsumer {
    string private constant ERROR_MODULE_NOT_SET = "CTD_MODULE_NOT_SET";
    string private constant ERROR_INVALID_MODULES_LINK_INPUT = "CTD_INVALID_MODULES_LINK_INPUT";
    string private constant ERROR_CONTROLLER_NOT_CONTRACT = "CTD_CONTROLLER_NOT_CONTRACT";
    string private constant ERROR_SENDER_NOT_ALLOWED = "CTD_SENDER_NOT_ALLOWED";
    string private constant ERROR_SENDER_NOT_CONTROLLER = "CTD_SENDER_NOT_CONTROLLER";
    string private constant ERROR_SENDER_NOT_CONFIG_GOVERNOR = "CTD_SENDER_NOT_CONFIG_GOVERNOR";
    string private constant ERROR_SENDER_NOT_ACTIVE_VOTING = "CTD_SENDER_NOT_ACTIVE_VOTING";
    string private constant ERROR_SENDER_NOT_ACTIVE_DISPUTE_MANAGER = "CTD_SEND_NOT_ACTIVE_DISPUTE_MGR";
    string private constant ERROR_SENDER_NOT_CURRENT_DISPUTE_MANAGER = "CTD_SEND_NOT_CURRENT_DISPUTE_MGR";

    // Address of the controller
    Controller public controller;

    // List of modules linked indexed by ID
    mapping (bytes32 => address) public linkedModules;

    event ModuleLinked(bytes32 id, address addr);

    /**
    * @dev Ensure the msg.sender is the controller's config governor
    */
    modifier onlyConfigGovernor {
        require(msg.sender == _configGovernor(), ERROR_SENDER_NOT_CONFIG_GOVERNOR);
        _;
    }

    /**
    * @dev Ensure the msg.sender is the controller
    */
    modifier onlyController() {
        require(msg.sender == address(controller), ERROR_SENDER_NOT_CONTROLLER);
        _;
    }

    /**
    * @dev Ensure the msg.sender is an active DisputeManager module
    */
    modifier onlyActiveDisputeManager() {
        require(controller.isActive(MODULE_ID_DISPUTE_MANAGER, msg.sender), ERROR_SENDER_NOT_ACTIVE_DISPUTE_MANAGER);
        _;
    }

    /**
    * @dev Ensure the msg.sender is the current DisputeManager module
    */
    modifier onlyCurrentDisputeManager() {
        (address addr, bool disabled) = controller.getDisputeManager();
        require(msg.sender == addr, ERROR_SENDER_NOT_CURRENT_DISPUTE_MANAGER);
        require(!disabled, ERROR_SENDER_NOT_ACTIVE_DISPUTE_MANAGER);
        _;
    }

    /**
    * @dev Ensure the msg.sender is an active Voting module
    */
    modifier onlyActiveVoting() {
        require(controller.isActive(MODULE_ID_VOTING, msg.sender), ERROR_SENDER_NOT_ACTIVE_VOTING);
        _;
    }

    /**
    * @dev This modifier will check that the sender is the user to act on behalf of or someone with the required permission
    * @param _user Address of the user to act on behalf of
    */
    modifier authenticateSender(address _user) {
        _authenticateSender(_user);
        _;
    }

    /**
    * @dev Constructor function
    * @param _controller Address of the controller
    */
    constructor(Controller _controller) public {
        require(isContract(address(_controller)), ERROR_CONTROLLER_NOT_CONTRACT);
        controller = _controller;
    }

    /**
    * @notice Update the implementation links of a list of modules
    * @dev The controller is expected to ensure the given addresses are correct modules
    * @param _ids List of IDs of the modules to be updated
    * @param _addresses List of module addresses to be updated
    */
    function linkModules(bytes32[] calldata _ids, address[] calldata _addresses) external onlyController {
        require(_ids.length == _addresses.length, ERROR_INVALID_MODULES_LINK_INPUT);

        for (uint256 i = 0; i < _ids.length; i++) {
            linkedModules[_ids[i]] = _addresses[i];
            emit ModuleLinked(_ids[i], _addresses[i]);
        }
    }

    /**
    * @dev Internal function to ensure the Protocol term is up-to-date, it will try to update it if not
    * @return Identification number of the current Protocol term
    */
    function _ensureCurrentTerm() internal returns (uint64) {
        return _clock().ensureCurrentTerm();
    }

    /**
    * @dev Internal function to fetch the last ensured term ID of the Protocol
    * @return Identification number of the last ensured term
    */
    function _getLastEnsuredTermId() internal view returns (uint64) {
        return _clock().getLastEnsuredTermId();
    }

    /**
    * @dev Internal function to tell the current term identification number
    * @return Identification number of the current term
    */
    function _getCurrentTermId() internal view returns (uint64) {
        return _clock().getCurrentTermId();
    }

    /**
    * @dev Internal function to fetch the controller's config governor
    * @return Address of the controller's config governor
    */
    function _configGovernor() internal view returns (address) {
        return controller.getConfigGovernor();
    }

    /**
    * @dev Internal function to fetch the address of the DisputeManager module
    * @return Address of the DisputeManager module
    */
    function _disputeManager() internal view returns (IDisputeManager) {
        return IDisputeManager(_getLinkedModule(MODULE_ID_DISPUTE_MANAGER));
    }

    /**
    * @dev Internal function to fetch the address of the GuardianRegistry module implementation
    * @return Address of the GuardianRegistry module implementation
    */
    function _guardiansRegistry() internal view returns (IGuardiansRegistry) {
        return IGuardiansRegistry(_getLinkedModule(MODULE_ID_GUARDIANS_REGISTRY));
    }

    /**
    * @dev Internal function to fetch the address of the Voting module implementation
    * @return Address of the Voting module implementation
    */
    function _voting() internal view returns (ICRVoting) {
        return ICRVoting(_getLinkedModule(MODULE_ID_VOTING));
    }

    /**
    * @dev Internal function to fetch the address of the PaymentsBook module implementation
    * @return Address of the PaymentsBook module implementation
    */
    function _paymentsBook() internal view returns (IPaymentsBook) {
        return IPaymentsBook(_getLinkedModule(MODULE_ID_PAYMENTS_BOOK));
    }

    /**
    * @dev Internal function to fetch the address of the Treasury module implementation
    * @return Address of the Treasury module implementation
    */
    function _treasury() internal view returns (ITreasury) {
        return ITreasury(_getLinkedModule(MODULE_ID_TREASURY));
    }

    /**
    * @dev Internal function to tell the address linked for a module based on a given ID
    * @param _id ID of the module being queried
    * @return Linked address of the requested module
    */
    function _getLinkedModule(bytes32 _id) internal view returns (address) {
        address module = linkedModules[_id];
        require(module != address(0), ERROR_MODULE_NOT_SET);
        return module;
    }

    /**
    * @dev Internal function to fetch the address of the Clock module from the controller
    * @return Address of the Clock module
    */
    function _clock() internal view returns (IClock) {
        return IClock(controller);
    }

    /**
    * @dev Internal function to fetch the address of the Config module from the controller
    * @return Address of the Config module
    */
    function _protocolConfig() internal view returns (IConfig) {
        return IConfig(controller);
    }

    /**
    * @dev Ensure that the sender is the user to act on behalf of or someone with the required permission
    * @param _user Address of the user to act on behalf of
    */
    function _authenticateSender(address _user) internal view {
        require(_isSenderAllowed(_user), ERROR_SENDER_NOT_ALLOWED);
    }

    /**
    * @dev Tell whether the sender is the user to act on behalf of or someone with the required permission
    * @param _user Address of the user to act on behalf of
    * @return True if the sender is the user to act on behalf of or someone with the required permission, false otherwise
    */
    function _isSenderAllowed(address _user) internal view returns (bool) {
        return msg.sender == _user || _hasRole(msg.sender);
    }

    /**
    * @dev Tell whether an address holds the required permission to access the requested functionality
    * @param _addr Address being checked
    * @return True if the given address has the required permission to access the requested functionality, false otherwise
    */
    function _hasRole(address _addr) internal view returns (bool) {
        bytes32 roleId = keccak256(abi.encodePacked(address(this), msg.sig));
        return controller.hasRole(_addr, roleId);
    }
}

// File: contracts/core/modules/ControlledRecoverable.sol

pragma solidity ^0.5.17;





contract ControlledRecoverable is Controlled {
    using SafeERC20 for IERC20;

    string private constant ERROR_SENDER_NOT_FUNDS_GOVERNOR = "CTD_SENDER_NOT_FUNDS_GOVERNOR";
    string private constant ERROR_INSUFFICIENT_RECOVER_FUNDS = "CTD_INSUFFICIENT_RECOVER_FUNDS";
    string private constant ERROR_RECOVER_TOKEN_FUNDS_FAILED = "CTD_RECOVER_TOKEN_FUNDS_FAILED";

    event RecoverFunds(address token, address recipient, uint256 balance);

    /**
    * @dev Ensure the msg.sender is the controller's funds governor
    */
    modifier onlyFundsGovernor {
        require(msg.sender == controller.getFundsGovernor(), ERROR_SENDER_NOT_FUNDS_GOVERNOR);
        _;
    }

    /**
    * @notice Transfer all `_token` tokens to `_to`
    * @param _token Address of the token to be recovered
    * @param _to Address of the recipient that will be receive all the funds of the requested token
    */
    function recoverFunds(address _token, address payable _to) external payable onlyFundsGovernor {
        uint256 balance;

        if (_token == address(0)) {
            balance = address(this).balance;
            require(_to.send(balance), ERROR_RECOVER_TOKEN_FUNDS_FAILED);
        } else {
            balance = IERC20(_token).balanceOf(address(this));
            require(balance > 0, ERROR_INSUFFICIENT_RECOVER_FUNDS);
            // No need to verify _token to be a contract as we have already checked the balance
            require(IERC20(_token).safeTransfer(_to, balance), ERROR_RECOVER_TOKEN_FUNDS_FAILED);
        }

        emit RecoverFunds(_token, _to, balance);
    }
}

// File: contracts/payments/PaymentsBook.sol

pragma solidity ^0.5.17;












contract PaymentsBook is IPaymentsBook, ControlledRecoverable, TimeHelpers {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;
    using SafeMath64 for uint64;
    using PctHelpers for uint256;

    string private constant ERROR_PROTOCOL_HAS_NOT_STARTED = "PB_PROTOCOL_HAS_NOT_STARTED";
    string private constant ERROR_NON_PAST_PERIOD = "PB_NON_PAST_PERIOD";
    string private constant ERROR_PERIOD_DURATION_ZERO = "PB_PERIOD_DURATION_ZERO";
    string private constant ERROR_PERIOD_BALANCE_DETAILS_NOT_COMPUTED = "PB_PER_BAL_DETAILS_NOT_COMPUTED";
    string private constant ERROR_PAYMENT_AMOUNT_ZERO = "PB_PAYMENT_AMOUNT_ZERO";
    string private constant ERROR_ETH_DEPOSIT_TOKEN_MISMATCH = "PB_ETH_DEPOSIT_TOKEN_MISMATCH";
    string private constant ERROR_ETH_DEPOSIT_AMOUNT_MISMATCH = "PB_ETH_DEPOSIT_AMOUNT_MISMATCH";
    string private constant ERROR_ETH_TRANSFER_FAILED = "PB_ETH_TRANSFER_FAILED";
    string private constant ERROR_TOKEN_NOT_CONTRACT = "PB_TOKEN_NOT_CONTRACT";
    string private constant ERROR_TOKEN_DEPOSIT_FAILED = "PB_TOKEN_DEPOSIT_FAILED";
    string private constant ERROR_TOKEN_TRANSFER_FAILED = "PB_TOKEN_TRANSFER_FAILED";
    string private constant ERROR_GUARDIAN_SHARE_ALREADY_CLAIMED = "PB_GUARDIAN_SHARE_ALREADY_CLAIMED";
    string private constant ERROR_GOVERNOR_SHARE_ALREADY_CLAIMED = "PB_GOVERNOR_SHARE_ALREADY_CLAIMED";
    string private constant ERROR_OVERRATED_GOVERNOR_SHARE_PCT = "PB_OVERRATED_GOVERNOR_SHARE_PCT";

    // Term 0 is for guardians on-boarding
    uint64 internal constant START_TERM_ID = 1;

    struct Period {
        // Protocol term ID of a period used to fetch the total active balance of the guardians registry
        uint64 balanceCheckpoint;
        // Total amount of guardian tokens active in the Protocol at the corresponding period checkpoint
        uint256 totalActiveBalance;
        // List of collected amounts for the governor indexed by token address
        mapping (address => uint256) governorShares;
        // List of tokens claimed by the governor during a period, indexed by token addresses
        mapping (address => bool) claimedGovernor;
        // List of collected amounts for the guardians indexed by token address
        mapping (address => uint256) guardiansShares;
        // List of guardians that have claimed their share during a period, indexed by guardian and token addresses
        mapping (address => mapping (address => bool)) claimedGuardians;
    }

    // Duration of a payment period in Protocol terms
    uint64 public periodDuration;

    // Permyriad of collected payments that will be allocated to the governor of the Protocol (‱ - 1/10,000)
    uint16 public governorSharePct;

    // List of periods indexed by ID
    mapping (uint256 => Period) internal periods;

    event PaymentReceived(uint256 indexed periodId, address indexed payer, address indexed token, uint256 amount, bytes data);
    event GuardianShareClaimed(uint256 indexed periodId, address indexed guardian, address indexed token, uint256 amount);
    event GovernorShareClaimed(uint256 indexed periodId, address indexed token, uint256 amount);
    event GovernorSharePctChanged(uint16 previousGovernorSharePct, uint16 currentGovernorSharePct);

    /**
    * @dev Initialize protocol payments book
    * @param _controller Address of the controller
    * @param _periodDuration Duration of a payment period in Protocol terms
    * @param _governorSharePct Initial permyriad of collected payments that will be allocated to the governor of the Protocol (‱ - 1/10,000)
    */
    constructor(Controller _controller, uint64 _periodDuration, uint16 _governorSharePct) Controlled(_controller) public {
        require(_periodDuration > 0, ERROR_PERIOD_DURATION_ZERO);

        periodDuration = _periodDuration;
        _setGovernorSharePct(_governorSharePct);
    }

    /**
    * @notice Pay `@tokenAmount(_token, _amount)` for `_payer` (`_data`)
    * @param _token Address of the token being paid
    * @param _amount Amount of tokens being paid
    * @param _payer Address paying on behalf of
    * @param _data Optional data
    */
    function pay(address _token, uint256 _amount, address _payer, bytes calldata _data) external payable {
        (uint256 periodId, Period storage period) = _getCurrentPeriod();
        require(_amount > 0, ERROR_PAYMENT_AMOUNT_ZERO);

        // Update collected amount for the governor
        uint256 governorShare = _amount.pct(governorSharePct);
        period.governorShares[_token] = period.governorShares[_token].add(governorShare);

        // Update collected amount for the guardians
        uint256 guardiansShare = _amount.sub(governorShare);
        period.guardiansShares[_token] = period.guardiansShares[_token].add(guardiansShare);

        // Deposit funds from sender to this contract
        // ETH or token amount checks are handled in `_deposit()`
        _deposit(msg.sender, _token, _amount);
        emit PaymentReceived(periodId, _payer, _token, _amount, _data);
    }

    /**
    * @notice Claim guardian share for period #`_periodId` owed to `_guardian`
    * @dev It will ignore tokens that were already claimed without reverting
    * @param _periodId Identification number of the period being claimed
    * @param _guardian Address of the guardian claiming the shares for
    * @param _tokens List of token addresses to be claimed
    */
    function claimGuardianShare(uint256 _periodId, address payable _guardian, address[] calldata _tokens)
        external
        authenticateSender(_guardian)
    {
        require(_periodId < _getCurrentPeriodId(), ERROR_NON_PAST_PERIOD);

        Period storage period = periods[_periodId];
        (uint64 periodBalanceCheckpoint, uint256 totalActiveBalance) = _ensurePeriodBalanceDetails(period, _periodId);
        uint256 guardianActiveBalance = _getGuardianActiveBalance(_guardian, periodBalanceCheckpoint);

        // We assume the token contract is not malicious
        for (uint256 i = 0; i < _tokens.length; i++) {
            address token = _tokens[i];
            require(!_hasGuardianClaimed(period, _guardian, token), ERROR_GUARDIAN_SHARE_ALREADY_CLAIMED);
            uint256 amount = _getGuardianShare(period, token, guardianActiveBalance, totalActiveBalance);
            _claimGuardianShare(period, _periodId, _guardian, token, amount);
        }
    }

    /**
    * @notice Transfer owed share to the governor for period #`_periodId`
    * @param _periodId Identification number of the period being claimed
    * @param _tokens List of token addresses to be claimed
    */
    function claimGovernorShare(uint256 _periodId, address[] calldata _tokens) external {
        require(_periodId < _getCurrentPeriodId(), ERROR_NON_PAST_PERIOD);

        Period storage period = periods[_periodId];
        address payable governor = address(uint160(_configGovernor()));

        // We assume the token contract is not malicious
        for (uint256 i = 0; i < _tokens.length; i++) {
            address token = _tokens[i];
            require(!_hasGovernorClaimed(period, token), ERROR_GOVERNOR_SHARE_ALREADY_CLAIMED);
            _claimGovernorShare(period, _periodId, governor, token);
        }
    }

    /**
    * @notice Make sure that the balance details of a certain period have been computed
    * @param _periodId Identification number of the period being ensured
    * @return periodBalanceCheckpoint Protocol term ID used to fetch the total active balance of the guardians registry
    * @return totalActiveBalance Total amount of guardian tokens active in the Protocol at the corresponding used checkpoint
    */
    function ensurePeriodBalanceDetails(uint256 _periodId) external returns (uint64 periodBalanceCheckpoint, uint256 totalActiveBalance) {
        require(_periodId < _getCurrentPeriodId(), ERROR_NON_PAST_PERIOD);
        Period storage period = periods[_periodId];
        return _ensurePeriodBalanceDetails(period, _periodId);
    }

    /**
    * @notice Set new governor share to `_governorSharePct`‱ (1/10,000)
    * @param _governorSharePct New permyriad of collected payments that will be allocated to the governor of the Protocol (‱ - 1/10,000)
    */
    function setGovernorSharePct(uint16 _governorSharePct) external onlyConfigGovernor {
        _setGovernorSharePct(_governorSharePct);
    }

    /**
    * @dev Tell the identification number of the current period
    * @return Identification number of the current period
    */
    function getCurrentPeriodId() external view returns (uint256) {
        return _getCurrentPeriodId();
    }

    /**
    * @dev Get the share details of a payment period
    * @param _periodId Identification number of the period to be queried
    * @param _token Address of the token querying the share details for
    * @return guardiansShare Guardians share for the requested period and token
    * @return governorShare Governor share for the requested period and token
    */
    function getPeriodShares(uint256 _periodId, address _token)
        external
        view
        returns (uint256 guardiansShare, uint256 governorShare)
    {
        Period storage period = periods[_periodId];
        guardiansShare = period.guardiansShares[_token];
        governorShare = period.governorShares[_token];
    }

    /**
    * @dev Get the balance details of a payment period
    * @param _periodId Identification number of the period to be queried
    * @return balanceCheckpoint Protocol term ID of a period used to fetch the total active balance of the guardians registry
    * @return totalActiveBalance Total amount of guardian tokens active in the Protocol at the corresponding period checkpoint
    */
    function getPeriodBalanceDetails(uint256 _periodId)
        external
        view
        returns (uint64 balanceCheckpoint, uint256 totalActiveBalance)
    {
        Period storage period = periods[_periodId];
        balanceCheckpoint = period.balanceCheckpoint;
        totalActiveBalance = period.totalActiveBalance;
    }

    /**
    * @dev Tell the share corresponding to a guardian for a certain period
    * @param _periodId Identification number of the period being queried
    * @param _guardian Address of the guardian querying the share of
    * @param _tokens List of token addresses to be queried
    * @return List of token amounts corresponding to the guardian
    */
    function getGuardianShare(uint256 _periodId, address _guardian, address[] calldata _tokens)
        external
        view
        returns (uint256[] memory amounts)
    {
        require(_periodId < _getCurrentPeriodId(), ERROR_NON_PAST_PERIOD);

        Period storage period = periods[_periodId];
        uint256 totalActiveBalance = period.totalActiveBalance;
        require(totalActiveBalance != 0, ERROR_PERIOD_BALANCE_DETAILS_NOT_COMPUTED);

        amounts = new uint256[](_tokens.length);
        uint256 guardianActiveBalance = _getGuardianActiveBalance(_guardian, period.balanceCheckpoint);
        for (uint256 i = 0; i < _tokens.length; i++) {
            amounts[i] = _getGuardianShare(period, _tokens[i], guardianActiveBalance, totalActiveBalance);
        }
    }

    /**
    * @dev Tell if a given guardian has already claimed the owed share for a certain period
    * @param _periodId Identification number of the period being queried
    * @param _guardian Address of the guardian being queried
    * @param _tokens List of token addresses to be queried
    * @return List of claimed status for each requested token
    */
    function hasGuardianClaimed(uint256 _periodId, address _guardian, address[] calldata _tokens)
        external
        view
        returns (bool[] memory claimed)
    {
        Period storage period = periods[_periodId];

        claimed = new bool[](_tokens.length);
        for (uint256 i = 0; i < _tokens.length; i++) {
            claimed[i] = _hasGuardianClaimed(period, _guardian, _tokens[i]);
        }
    }

    /**
    * @dev Tell the share corresponding to the governor for a certain period
    * @param _periodId Identification number of the period being queried
    * @param _tokens List of token addresses to be queried
    * @return List of token amounts corresponding to the governor
    */
    function getGovernorShare(uint256 _periodId, address[] calldata _tokens) external view returns (uint256[] memory amounts) {
        Period storage period = periods[_periodId];

        amounts = new uint256[](_tokens.length);
        for (uint256 i = 0; i < _tokens.length; i++) {
            amounts[i] = _getGovernorShare(period, _tokens[i]);
        }
    }

    /**
    * @dev Tell if the governor has already claimed the owed share for a certain period
    * @param _periodId Identification number of the period being queried
    * @param _tokens List of token addresses to be queried
    * @return List of claimed status for each requested token
    */
    function hasGovernorClaimed(uint256 _periodId, address[] calldata _tokens)
        external
        view
        returns (bool[] memory claimed)
    {
        Period storage period = periods[_periodId];

        claimed = new bool[](_tokens.length);
        for (uint256 i = 0; i < _tokens.length; i++) {
            claimed[i] = _hasGovernorClaimed(period, _tokens[i]);
        }
    }

    /**
    * @dev Internal function to claim guardian share for a certain period
    * @param _period Period being claimed
    * @param _periodId Identification number of the period being claimed
    * @param _guardian Address of the guardian claiming their share
    * @param _token Address of the token being claimed
    * @param _amount Amount of tokens to be transferred to the guardian
    */
    function _claimGuardianShare(
        Period storage _period,
        uint256 _periodId,
        address payable _guardian,
        address _token,
        uint256 _amount
    )
        internal
    {
        _period.claimedGuardians[_guardian][_token] = true;
        if (_amount > 0) {
            _transfer(_guardian, _token, _amount);
            emit GuardianShareClaimed(_periodId, _guardian, _token, _amount);
        }
    }

    /**
    * @dev Internal function to transfer governor share for a certain period
    * @param _period Period being claimed
    * @param _periodId Identification number of the period being claimed
    * @param _token Address of the token to be claimed
    */
    function _claimGovernorShare(Period storage _period, uint256 _periodId, address payable _governor, address _token) internal {
        _period.claimedGovernor[_token] = true;
        uint256 amount = _getGovernorShare(_period, _token);
        if (amount > 0) {
            _transfer(_governor, _token, amount);
            emit GovernorShareClaimed(_periodId, _token, amount);
        }
    }

    /**
    * @dev Internal function to pull tokens into this contract
    * @param _from Owner of the deposited funds
    * @param _token Address of the token to deposit
    * @param _amount Amount to be deposited
    */
    function _deposit(address _from, address _token, uint256 _amount) internal {
        if (msg.value > 0) {
            require(_token == address(0), ERROR_ETH_DEPOSIT_TOKEN_MISMATCH);
            require(msg.value == _amount, ERROR_ETH_DEPOSIT_AMOUNT_MISMATCH);
        } else {
            require(isContract(_token), ERROR_TOKEN_NOT_CONTRACT);
            require(IERC20(_token).safeTransferFrom(_from, address(this), _amount), ERROR_TOKEN_DEPOSIT_FAILED);
        }
    }

    /**
    * @dev Internal function to transfer tokens
    * @param _to Recipient of the transfer
    * @param _token Address of the token to transfer
    * @param _amount Amount to be transferred
    */
    function _transfer(address payable _to, address _token, uint256 _amount) internal {
        if (_token == address(0)) {
            require(_to.send(_amount), ERROR_ETH_TRANSFER_FAILED);
        } else {
            require(IERC20(_token).safeTransfer(_to, _amount), ERROR_TOKEN_TRANSFER_FAILED);
        }
    }

    /**
    * @dev Internal function to make sure that the balance details of a certain period have been computed.
    *      This function assumes given ID and period correspond to each other, and that the period is in the past.
    * @param _periodId Identification number of the period being ensured
    * @param _period Period being ensured
    * @return Protocol term ID used to fetch the total active balance of the guardians registry
    * @return Total amount of guardian tokens active in the Protocol at the corresponding used checkpoint
    */
    function _ensurePeriodBalanceDetails(Period storage _period, uint256 _periodId) internal returns (uint64, uint256) {
        // Shortcut if the period balance details were already set
        uint256 totalActiveBalance = _period.totalActiveBalance;
        if (totalActiveBalance != 0) {
            return (_period.balanceCheckpoint, totalActiveBalance);
        }

        uint64 periodStartTermId = _getPeriodStartTermId(_periodId);
        uint64 nextPeriodStartTermId = _getPeriodStartTermId(_periodId.add(1));

        // Pick a random Protocol term during the next period of the requested one to get the total amount of guardian tokens active in the Protocol
        IClock clock = _clock();
        bytes32 randomness = clock.getTermRandomness(nextPeriodStartTermId);

        // The randomness factor for each Protocol term is computed using the the hash of a block number set during the initialization of the
        // term, to ensure it cannot be known beforehand. Note that the hash function being used only works for the 256 most recent block
        // numbers. Therefore, if that occurs we use the hash of the previous block number. This could be slightly beneficial for the first
        // guardian calling this function, but it's still impossible to predict during the requested period.
        if (randomness == bytes32(0)) {
            randomness = blockhash(getBlockNumber() - 1);
        }

        // Use randomness to choose a Protocol term of the requested period and query the total amount of guardian tokens active at that term
        IGuardiansRegistry guardiansRegistry = _guardiansRegistry();
        uint64 periodBalanceCheckpoint = periodStartTermId.add(uint64(uint256(randomness) % periodDuration));
        totalActiveBalance = guardiansRegistry.totalActiveBalanceAt(periodBalanceCheckpoint);

        _period.balanceCheckpoint = periodBalanceCheckpoint;
        _period.totalActiveBalance = totalActiveBalance;
        return (periodBalanceCheckpoint, totalActiveBalance);
    }

    /**
    * @dev Internal function to set a new governor share value
    * @param _governorSharePct New permyriad of collected payments that will be allocated to the governor of the Protocol (‱ - 1/10,000)
    */
    function _setGovernorSharePct(uint16 _governorSharePct) internal {
        // Check governor share is not greater than 10,000‱
        require(PctHelpers.isValid(_governorSharePct), ERROR_OVERRATED_GOVERNOR_SHARE_PCT);

        emit GovernorSharePctChanged(governorSharePct, _governorSharePct);
        governorSharePct = _governorSharePct;
    }

    /**
    * @dev Internal function to tell the identification number of the current period
    * @return Identification number of the current period
    */
    function _getCurrentPeriodId() internal view returns (uint256) {
        // Since the Protocol starts at term #1, and the first payment period is #0, then subtract one unit to the current term of the Protocol
        uint64 termId = _getCurrentTermId();
        require(termId > 0, ERROR_PROTOCOL_HAS_NOT_STARTED);

        // No need for SafeMath: we already checked that the term ID is at least 1
        uint64 periodId = (termId - START_TERM_ID) / periodDuration;
        return uint256(periodId);
    }

    /**
    * @dev Internal function to get the current period
    * @return periodId Identification number of the current period
    * @return period Current period instance
    */
    function _getCurrentPeriod() internal view returns (uint256 periodId, Period storage period) {
        periodId = _getCurrentPeriodId();
        period = periods[periodId];
    }

    /**
    * @dev Internal function to get the Protocol term in which a certain period starts
    * @param _periodId Identification number of the period querying the start term of
    * @return Protocol term where the given period starts
    */
    function _getPeriodStartTermId(uint256 _periodId) internal view returns (uint64) {
        // Periods are measured in Protocol terms
        // Since Protocol terms are represented in uint64, we are safe to use uint64 for period ids too
        return START_TERM_ID.add(uint64(_periodId).mul(periodDuration));
    }

    /**
    * @dev Internal function to tell the active balance of a guardian for a certain period
    * @param _guardian Address of the guardian querying the share of
    * @param _periodBalanceCheckpoint Checkpoint of the period being queried
    * @return Active balance for a guardian based on the period checkpoint
    */
    function _getGuardianActiveBalance(address _guardian, uint64 _periodBalanceCheckpoint) internal view returns (uint256) {
        IGuardiansRegistry guardiansRegistry = _guardiansRegistry();
        return guardiansRegistry.activeBalanceOfAt(_guardian, _periodBalanceCheckpoint);
    }

    /**
    * @dev Internal function to tell the share corresponding to a guardian for a certain period and token
    * @param _period Period being queried
    * @param _token Address of the token being queried
    * @param _guardianActiveBalance Active balance of a guardian at the corresponding period checkpoint
    * @param _totalActiveBalance Total amount of guardian tokens active in the Protocol at the corresponding period checkpoint
    * @return Share owed to the given guardian for the requested period and token
    */
    function _getGuardianShare(
        Period storage _period,
        address _token,
        uint256 _guardianActiveBalance,
        uint256 _totalActiveBalance
    )
        internal
        view
        returns (uint256)
    {
        if (_guardianActiveBalance == 0) {
            return 0;
        }

        // Note that we already checked the guardian active balance is greater than zero.
        // Then, the total active balance should be greater than zero.
        return _period.guardiansShares[_token].mul(_guardianActiveBalance) / _totalActiveBalance;
    }

    /**
    * @dev Tell if a guardian has already claimed the owed share for a certain period
    * @param _period Period being queried
    * @param _guardian Address of the guardian being queried
    * @param _token Address of the token to be queried
    * @return True if the guardian has already claimed their share
    */
    function _hasGuardianClaimed(Period storage _period, address _guardian, address _token) internal view returns (bool) {
        return _period.claimedGuardians[_guardian][_token];
    }

    /**
    * @dev Tell the share corresponding to a guardian for a certain period
    * @param _period Period being queried
    * @param _token Address of the token to be queried
    * @return Token amount corresponding to the governor
    */
    function _getGovernorShare(Period storage _period, address _token) internal view returns (uint256) {
        return _period.governorShares[_token];
    }

    /**
    * @dev Tell if the governor has already claimed the owed share for a certain period
    * @param _period Period being queried
    * @param _token Address of the token to be queried
    * @return True if the governor has already claimed their share
    */
    function _hasGovernorClaimed(Period storage _period, address _token) internal view returns (bool) {
        return _period.claimedGovernor[_token];
    }
}
