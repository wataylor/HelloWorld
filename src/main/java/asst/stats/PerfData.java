package asst.stats;

/**
 * Utilities for monitoring performance
 * @author wat
 *
 */
public class PerfData {

  /**
   * @param e throwable
   * @return string giving our first class and line number or the first one
   */
  public static String ourCause(Throwable e) {
    return ourCause(e, 1);
  }

  /**
   * @param e throwable
   * @param howMany how many trace rows to include in the bad news
   * @return string giving our first class and line number or the first one
   */
  public static String ourCause(Throwable e, int howMany) {
    while (e.getCause() != null) { e = e.getCause(); }
    StackTraceElement[] stes = e.getStackTrace();
    StackTraceElement ste;
    int i;
    int len = stes.length;
    for (i=0; i<len; i++) {
      ste = stes[i];
      if (ste.getClassName().startsWith("asst")) {
	String cmt = (e.getMessage() != null) ? e.getMessage() : e.toString();
	StringBuilder sb =
	    new StringBuilder(cmt.replace('"', '_') + " " +
		ste.getClassName() + " " + ste.getMethodName() + " " +
		ste.getLineNumber());
	while ((i++ < len) && (--howMany > 0)) {
	  ste = stes[i];
	  sb.append(" " + ste.getClassName() + " " + ste.getMethodName() +
	      " " + ste.getLineNumber());
	}
	return sb.toString();
      }
    }
    stes = e.getStackTrace();
    return e.getMessage().replace('"', '_') + " " + stes[0].getClassName() +
	" " + stes[0].getLineNumber();
  }

}
