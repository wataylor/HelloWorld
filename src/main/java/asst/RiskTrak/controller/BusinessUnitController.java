package asst.RiskTrak.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import asst.RiskTrak.model.BusinessUnit;
import asst.RiskTrak.repository.IBusinessUnitRepository;
import asst.utils.MaN;

@RestController
@RequestMapping("api/v1/")
public class BusinessUnitController {
  @Autowired private IBusinessUnitRepository businessUnitRepository;

  @RequestMapping(value="businessUnits", method=RequestMethod.GET)
  public List<BusinessUnit> list() {
    boolean success = true;
    List<BusinessUnit> bulist = businessUnitRepository.findAll();
    if (MaN.isListMTP(bulist)) {
      throw new XceptionNotFound();
    }
    for (BusinessUnit bu : bulist) {
      if (!bu.databaseToForm()) {
	success = false;
      }
    }
    if (!success) {
      throw new XceptionServerError();
    }
    return bulist;
  }

  /* Create a new businessUnit - has to generate the new ID */
  @RequestMapping(value="businessUnit", method=RequestMethod.POST)
  public BusinessUnit create(@RequestBody BusinessUnit businessUnit) {
    // return BusinessUnitStub.create(businessUnit);
    businessUnit.setuUID(MaN.anyNewDBKey());
    return businessUnitRepository.saveAndFlush(businessUnit);
  }

  @RequestMapping(value="businessUnit/{id}", method=RequestMethod.GET) 
  public BusinessUnit get(@PathVariable String id) {
    // return BusinessUnitStub.get(id);
    BusinessUnit bu = businessUnitRepository.findOne(id);
    if (bu == null) {
      throw new XceptionNotFound();
    }
    if (!bu.databaseToForm()) {
      throw new XceptionServerError();
    }
    return bu;
  }

  /* Update an existing businessUnit */
  @RequestMapping(value="businessUnit/{id}", method=RequestMethod.PUT) 
  public BusinessUnit update(@PathVariable String id, @RequestBody BusinessUnit businessUnit) {
    //return BusinessUnitStub.update(id, businessUnit);
    BusinessUnit existingBusinessUnit = businessUnitRepository.findOne(id);
    BeanUtils.copyProperties(businessUnit, existingBusinessUnit);
    return businessUnitRepository.saveAndFlush(existingBusinessUnit);
  }

  @RequestMapping(value="businessUnit/{id}", method=RequestMethod.DELETE) 
  public BusinessUnit delete(@PathVariable String id) {
    // return BusinessUnitStub.delete(id);
    BusinessUnit existingBusinessUnit = businessUnitRepository.findOne(id);
    businessUnitRepository.delete(existingBusinessUnit);
    return existingBusinessUnit;
  }

}
