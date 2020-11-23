// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Cancer {

// mapping
     
    mapping (uint => Progesteron) private intensity;
    mapping(uint => Estrogen) private intensify;
    mapping(uint => Type) private types;
    mapping (uint => Surgery) public Surgeries;
    
// Cancer Grades 
     
    uint [] public Grade = 
    [0,1,2,3,4];
    
// Surgery Data

    uint256 public SurgeryCount = 0;

struct Surgery {
    uint _id;
    string _leftBreast;
    string _rightBreast;
}
function getSurgery(uint _id, string memory _leftBreast, string memory _rightBreast) public {
    SurgeryCount +=1;
    Surgeries[SurgeryCount] = Surgery(SurgeryCount, _leftBreast, _rightBreast);
}

    
// cancer types // Type Yes Or No 
    
    struct Type {
        string ductalcarcinoma;
        string lubilarcarcinoma;
        string Inflammatory;
        string TripleNCancer;
    }
    
    function addType(uint _id, string memory _ductalcarcinoma, string memory _lubilarcarcinoma, string memory _Inflamatory, string memory _TripleNCancer) public {
        types[_id] = Type(_ductalcarcinoma, _lubilarcarcinoma, _Inflamatory, _TripleNCancer);
    }
    
//Imuno Astro Chemistry Study of Hormone Receptors Her2 Protien Over Epression & Ki67 
// ASCO/CAP gidline
    
    
// Progesteron Cases Data
    
    uint[] private prog =
    [1,2,3,4,5,6,7,8,9,10,
    11,12,13,14,15,16,17,18,19,20,
    21,22,23,24,25,26,27,28,29,30,
    31,32,33,34,35,36,37,38,39,40,
    41,42,43,44,45,46,47,48,49,50,
    51,52,53,54,55,56,57,58,59,60,
    61,62,63,64,65,66,67,68,69,70,
    71,72,73,74,75,76,77,78,79,80,
    81,82,83,84,85,86,87,88,89,90,
    91,92,93,94,95,96,97,98,99,100];
    
    
    struct Progesteron {
        string intense;
        string interpret;
        uint  percentage;
          } 

    
    function addProgesteron(uint _id, string memory _intense, string memory _interpret, uint _percentage) public {
        intensity[_id] = Progesteron(_intense, _interpret, _percentage);
    }
    
    
    // estrogen Cases Data 
    
    
    uint[] private EstroPer =
    [1,2,3,4,5,6,7,8,9,10,
    11,12,13,14,15,16,17,18,19,20,
    21,22,23,24,25,26,27,28,29,30,
    31,32,33,34,35,36,37,38,39,40,
    41,42,43,44,45,46,47,48,49,50,
    51,52,53,54,55,56,57,58,59,60,
    61,62,63,64,65,66,67,68,69,70,
    71,72,73,74,75,76,77,78,79,80,
    81,82,83,84,85,86,87,88,89,90,
    91,92,93,94,95,96,97,98,99,100];
    
    struct Estrogen {
        string intense;
        string interpret;
        uint percentage;
    }
    
    function addEstrogen(uint _id, string memory _intense, string memory _interpret, uint _percentage) public {
        intensify[_id] = Estrogen(_intense, _interpret, _percentage);
    
    }
    
    uint percentage =60;
    function Estro () public returns (string memory) {
        if (percentage < 50) {
            result ="Estro Negative";
        } 
        else{
            if(percentage==50){
                
                result="Estrogen is present normal";
            }
            else{
                if(percentage>50){
                    result="Estrogen is present strongly";
                }
                else{ }
            }
        }
        return result;
    }  
    // HerTwo Percentage 
    
     uint[] public Her = [0,1,2,3,4];
    
    uint i = 0;
    string result;
    
    function descision () public returns (string memory) {
        if (i < 1) {
            result ="Her Two negative";
        } 
        else{
            if(i==1){
                result="Her Two positive";
            }
            else{
                if(i>=1||i==2){
                    result="Her Two positive ";
                }
                else{
                                    }
            }
        }
        return result;
    }  
}



