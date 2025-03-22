// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {

    struct  Candidate{
        string name;
        string candidateId;
        uint256 voteCount;
    }

    
    mapping(uint256 => Candidate) public candidate;

    function registerCandiddate (string memory _name, string memory _candidateId, uint256 voteCount) external  {
        Candidate storage newCandidate = candidate[_candidateId];
        newCandidate.name = _name;
        newCandidate.voteCount += 1;
    }

    function voteCandidate(uint256 _candidateId) external {
        Candidate storage newCandidate = candidate[_candidateId];
        newCandidate.voteCount += 1;
    }
}