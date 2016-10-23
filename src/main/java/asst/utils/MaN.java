package asst.utils;

import java.util.List;
import java.util.UUID;

/**
 * Collection of useful manipulations
 * @author wat
 *
 */
public class MaN {

  /** Test a string for content.
   * @param str input string
   * @return true if it is empty, which means either null or zero length
   */
  public static boolean isStringMTP(String str) {
    return ((str == null) || (str.length() <= 0));
  }

  /** Test a list for content
   * @param list the list of any type
   * @return true if the list is empty, either null or zero size
   */
  public static boolean isListMTP(List<?> list) {
    return ((list == null) || (list.size() <= 0));
  }

  /** Generate a unique random string for use as a database key.
   * These strings are random across all domains so any such string
   * can be guaranteed to be a unique key for use in any database.
   * This method leaves out dashes which the toString() method
   * inserts.  That makes these keys shorter.  The dashes add no
   * information because they are the same in all UUIDs.
   * @return 32 character random string
   */
  public static String anyNewDBKey() {
    UUID uuid = UUID.randomUUID();
    String firstHalf = Long.toHexString(uuid.getMostSignificantBits());
    while (firstHalf.length() < 16)  { firstHalf  = "0" + firstHalf; }
    String secondHalf = Long.toHexString(uuid.getLeastSignificantBits());
    while (secondHalf.length() < 16) { secondHalf = "0" + secondHalf; }
    return firstHalf + secondHalf;
  }

  /** Safely convert a string to a long, returning 0 in case of
      difficulty.
      @param val input string
      @return long representation of the string or 0*/
  public static long longFromString(String val) {
    try {
      return Long.parseLong(val);
    } catch (Exception e) {
    }
    return 0;
  }

  /** Safely convert a string to an integer, returning 0 in case of
      difficulty.
      @param val input string
      @return integer representation of the string or 0*/
  public static int integerFromString(String val) {
    try {
      return Integer.parseInt(val);
    } catch (Exception e) {
    }
    return 0;
  }

  /** Safely convert a string to a floating point number, returning 0
      in case of difficulty.
      @param val input string
      @return floating point representation of the string or 0*/
  public static float floatFromString(String val) {
    try {
      return Float.parseFloat(val);
    } catch (Exception e) {
    }
    return (float)0.0;
  }

  /** Safely convert a string to a double floating point number, returning 0
      in case of difficulty.
      @param val input string
      @return floating point representation of the string or 0*/
  public static double doubleFromString(String val) {
    try {
      return Double.parseDouble(val);
    } catch (Exception e) {
    }
    return (float)0.0;
  }

}
