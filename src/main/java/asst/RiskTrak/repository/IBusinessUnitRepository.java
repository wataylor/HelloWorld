package asst.RiskTrak.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import asst.RiskTrak.model.BusinessUnit;

public interface IBusinessUnitRepository extends JpaRepository<BusinessUnit, String> {

}
