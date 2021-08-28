pragma solidity >=0.4.22 <0.9.0;

contract System {
    enum ShippingStatus { Pending, Shipped, Delivered }
    enum VaccinationStatus { Vaccinated, NotVaccinated, Unknown }

    ShippingStatus private status;
    VaccinationStatus private vaccineStatus;

    VaccinationStatus private patientStatus;
    
    event LogNewAlert(string description);
    
    constructor() public {
        patientStatus = VaccinationStatus.Unknown;
    }

    function Vaccinate() public {
        patientStatus = VaccinationStatus.Vaccinated;
        emit LogNewAlert("Your patient has been vaccinated");
    }

    function Delivered() public {
        status = ShippingStatus.Delivered;
        emit LogNewAlert("Your Vaccine Package has been shipped!");

    }

    function getStatus(VaccinationStatus _status) internal pure returns (string memory) {
        if (VaccinationStatus.Vaccinated == _status) return "Vaccinated";
        if (VaccinationStatus.NotVaccinated == _status) return "NotVaccinated";
        if (VaccinationStatus.Unknown == _status) return "Unknown";
        
    }
    function Status() public view returns (string memory) {
        VaccinationStatus _status = vaccineStatus ;
        return getStatus(_status);
        
    }





}