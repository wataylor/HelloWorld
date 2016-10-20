package asst.RiskTrak.model;

/**
 * All database rows in this application are nodes in a tree.  Each node must
 * implement this interface.
 * @author wat
 * @since 2016 10
 *
 */
public interface INode {
  /** Some database tables have status fields which should not be
   * shown as a single column and must be changed to and from a
   * collection of booleans which drive check boxes in the form.  The
   * booleans are part of the JSON object but not written to the
   * database.  Such fields are written to the database but not to
   * the form.  This method is run after reading a row in order to
   * read status Y n flags to set or clear the matching booleans.
   * This method also replaces null field values with defaults. */
  public boolean databaseToForm();
  /** Some database tables have status fields which should not be
   * shown as a single column; it must be changed to and from a
   * collection of booleans which drive check boxes in the form.  The
   * booleans are part of the JSON object but not written to the
   * database.  The Status field is written to the database but not to
   * the form.  This method is run after reading and validating an
   * object from the client to set status Y n flags from the matching
   * booleans.  This method also replaces default field values with null
   * if the Column annotation allows nulls. */
  public boolean formToDatabase();

}
