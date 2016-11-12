package asst.RiskTrak.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * This class reads a view which joins BusinessUnits with the users who
 * last changed the BusinessUnit and who own the BusinessUnit.  This
 * view may not be updated which is why all columns are flagged as
 * updatable false.
 * Every entity needs an Id column which defines its primary key.  See
 * also the @Embeddable annotation
 * @author wat
 *
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name="businessusers") // bogus mapping - there are joins
public class BusinessUser implements INode{
  @Id
  @JsonProperty("uUID")
  @Column(columnDefinition="UUID", length=32, unique=true, updatable=false)
  public String uUID;

  @JsonProperty("title")
  @Column(columnDefinition="Title", length=255, nullable=true, updatable=false)
  public String title;

  @JsonProperty("description")
  @Column(columnDefinition="Description", nullable=true, updatable=false)
  public String description;

  @JsonProperty("umSal")
  @Column(columnDefinition="UMSalutation", nullable=true, updatable=false)
  public String umSalutation;
  @JsonProperty("umFirstName")
  @Column(columnDefinition="UMFirstName", nullable=true, updatable=false)
  public String umFirstName;
  @JsonProperty("umMiddleName")
  @Column(columnDefinition="UMMiddleName", nullable=true, updatable=false)
  public String umMiddlename;
  @JsonProperty("umLastName")
  @Column(columnDefinition="UMLastName", nullable=true, updatable=false)
  public String umLastName;
  @JsonProperty("umSuffix")
  @Column(columnDefinition="UMSuffix", nullable=true, updatable=false)
  public String umSuffix;
  @JsonProperty("umPhone")
  @Column(columnDefinition="UMPhone", nullable=true, updatable=false)
  public String umPhone;
  @JsonProperty("umEmail")
  @Column(columnDefinition="UMEmailAddres", nullable=true, updatable=false)
  public String umEmail;

  @JsonProperty("ucSal")
  @Column(columnDefinition="UCSalutation", nullable=true, updatable=false)
  public String ucSalutation;
  @JsonProperty("ucFirstName")
  @Column(columnDefinition="UCFirstName", nullable=true, updatable=false)
  public String ucFirstName;
  @JsonProperty("ucMiddleName")
  @Column(columnDefinition="UCMiddleName", nullable=true, updatable=false)
  public String ucMiddlename;
  @JsonProperty("ucLastName")
  @Column(columnDefinition="UCLastName", nullable=true, updatable=false)
  public String ucLastName;
  @JsonProperty("ucSuffix")
  @Column(columnDefinition="UCSuffix", nullable=true, updatable=false)
  public String ucSuffix;
  @JsonProperty("ucPhone")
  @Column(columnDefinition="UCPhone", nullable=true, updatable=false)
  public String ucPhone;
  @JsonProperty("ucEmail")
  @Column(columnDefinition="UCEmailAddres", nullable=true, updatable=false)
  public String ucEmail;

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