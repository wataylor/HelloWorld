package asst.RiskTrak.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asst.RiskTrak.model.BusinessUser;

public interface IBusinessUserRepository extends JpaRepository<BusinessUser, String> {

  /**
   * Constructing table views in MySQL requires special permissions.
   * Building the queries instead of defining table views avoids the
   * necessity of elevated permission and makes it much easier to provide
   * complex where clauses.
   */
  public static final String VIEW_QUERY =
      "select bu.UUID, bu.Title, bu.Description, bu.Modified, bu.Created, bu.AssignedOn,"
	  + "um.Salutation as UMSalutation, um.FirstName AS UMFirstname,"
	  + "um.MiddleName AS UMMiddleName, um.LastName as UMLastName,"
	  + "um.Suffix as UMSuffix, um.Phone as UMPhone, um.EmailAddress as UMEmail,"
	  + "uc.Salutation as UCSalutation, uc.FirstName AS UCFirstname,"
	  + "uc.MiddleName AS UCMiddleName, uc.LastName as UCLastName,"
	  + "uc.Suffix as UCSuffix, uc.Phone as UCPhone, uc.EmailAddress as UCEmail,"
	  + "ae.Salutation as AESalutation, ae.FirstName AS AEFirstname,"
	  + "ae.MiddleName AS AEMiddleName, ae.LastName as AELastName,"
	  + "ae.Suffix as AESuffix, ae.Phone as AEPhone, ae.EmailAddress as AEEmail,"
	  + "ab.Salutation as ABSalutation, ab.FirstName AS ABFirstname,"
	  + "ab.MiddleName AS ABMiddleName, ab.LastName as ABLastName,"
	  + "ab.Suffix as ABSuffix, ab.Phone as ABPhone, ab.EmailAddress as ABEmail"
	  + " from businessunits bu left join users um on bu.ModifiedByID = um.UUID"
	  + " left join users uc on bu.ModifiedByID = uc.UUID"
	  + " left join users ae on bu.AssigneeID = ae.UUID"
	  + " left join users ab on bu.AssignedByID = ab.UUID ";

  @Query(value=VIEW_QUERY, nativeQuery=true)
  public List<BusinessUser> queryAllBusinessUsers();

  @Query(value=VIEW_QUERY + "where bu.UUID= :uUID", nativeQuery=true)
  public BusinessUser queryById(@Param("uUID") String uUID);
}
