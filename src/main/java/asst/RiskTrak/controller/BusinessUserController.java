package asst.RiskTrak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import asst.RiskTrak.model.BusinessUser;
import asst.RiskTrak.repository.IBusinessUserRepository;
import asst.utils.MaN;

/**
 * A business user is a view which specifies a left join between the
 * business units table and the users table so that the result
 * includes information about whomever last changed the unit and
 * whomever created it.
 * @author wat
 * @since 2016 11
 */
@RestController
@RequestMapping("api/v1/")
public class BusinessUserController {
  @Autowired private IBusinessUserRepository businessUserRepository;

  @RequestMapping(value="businessUsers", method=RequestMethod.GET)
  public List<BusinessUser> list() {
    boolean success = true;
    List<BusinessUser> bulist = businessUserRepository.queryAllBusinessUsers();
    if (MaN.isListMTP(bulist)) {
      throw new XceptionNotFound();
    }
    for (BusinessUser bu : bulist) {
      if (!bu.databaseToForm()) {
	success = false;
      }
    }
    if (!success) {
      throw new XceptionServerError();
    }
    return bulist;
  }

  @RequestMapping(value="businessUser/{id}", method=RequestMethod.GET)
  public BusinessUser get(@PathVariable String id) {
    // return BusinessuserStub.get(id);
    BusinessUser bu = businessUserRepository.queryById(id);
    if (bu == null) {
      throw new XceptionNotFound();
    }
    if (!bu.databaseToForm()) {
      throw new XceptionServerError();
    }
    return bu;
  }

}
