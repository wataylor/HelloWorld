package asst.RiskTrak.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import asst.RiskTrak.model.BusinessUser;

public interface IBusinessUserRepository extends JpaRepository<BusinessUser, String> {

}
