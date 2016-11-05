package asst.RiskTrak.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Every entity needs an Id column which defines its primary key.  See
 * also the @Embeddable annotation
 * @author wat
 *
 */
@Entity
@Table(name="businessunits")
public class BusinessUnit implements INode{
  @Id
  @JsonProperty("uUID")
  @Column(columnDefinition="UUID", length=32, unique=true, updatable=false)
  public String uUID;

  @JsonProperty("owningBusUnitID")
  @Column(columnDefinition="OwningBusUnitID", length=32, nullable=true)
  public String owningBusUnitID;

  @JsonProperty("modified")
  @Column(columnDefinition="Modified", updatable=false)
  public String modified;

  @JsonProperty("modifiedByID")
  @Column(columnDefinition="ModifiedByID", length=32)
  public String modifiedByID;

  @JsonProperty("created")
  @Column(columnDefinition="Created", updatable=false, nullable=true)
  public Long created;

  @JsonProperty("createdByID")
  @Column(columnDefinition="CreatedByID", length=32, updatable=false)
  public String createdByID;

  @JsonProperty("parentID")
  @Column(columnDefinition="ParentID", length=32, nullable=true)
  public String parentID;

  @JsonProperty("title")
  @Column(columnDefinition="Title", length=255, nullable=true)
  public String title;

  @JsonProperty("description")
  @Column(columnDefinition="Description", nullable=true)
  public String description;

  @JsonProperty("contactID")
  @Column(columnDefinition="ContactID", length=32)
  public String contactID;

  public String getuUID() {
    return uUID;
  }

  public void setuUID(String uUID) {
    this.uUID = uUID;
  }

  public String getOwningBusUnitID() {
    return owningBusUnitID;
  }

  public void setOwningBusUnitID(String owningBusUnitID) {
    this.owningBusUnitID = owningBusUnitID;
  }

  public String getModified() {
    return modified;
  }

  public void setModified(String modified) {
    this.modified = modified;
  }

  public String getModifiedByID() {
    return modifiedByID;
  }

  public void setModifiedByID(String modifiedByID) {
    this.modifiedByID = modifiedByID;
  }

  public long getCreated() {
    return created;
  }

  public void setCreated(long created) {
    this.created = created;
  }

  public String getCreatedByID() {
    return createdByID;
  }

  public void setCreatedByID(String createdByID) {
    this.createdByID = createdByID;
  }

  public String getParentID() {
    return parentID;
  }

  public void setParentID(String businessUnitParentID) {
    this.parentID = businessUnitParentID;
  }

  public String getBusinessUnitTitle() {
    return title;
  }

  public void setTitle(String businessUnitTitle) {
    this.title = businessUnitTitle;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String businessUnitDescription) {
    this.description = businessUnitDescription;
  }

  public String getContactID() {
    return contactID;
  }

  public void setContactID(String businessUnitContactID) {
    this.contactID = businessUnitContactID;
  }

  @Override
  public boolean databaseToForm() {
    // TODO Convert status string to booleans
    return NodeUtilities.disanullment(this);
  }

  @Override
  public boolean formToDatabase() {
    return NodeUtilities.nullification(this);
  }

}