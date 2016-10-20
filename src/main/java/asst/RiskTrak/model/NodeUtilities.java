package asst.RiskTrak.model;

import java.lang.reflect.Field;

import javax.persistence.Column;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import asst.stats.PerfData;

/**
 * Database rows are not always in the proper format for being sent to
 * the client as JSON objects.  These utilities help convert database rows
 * to and from JSON-capable objects.
 * @author wat
 *
 */
public class NodeUtilities {

  final static Logger logger = LoggerFactory.getLogger(NodeUtilities.class);

  /**
   * Objects which are being sent to the client should not be null because
   * that gives the .html display a hard time.  This converts all null
   * fields to their default values.
   * @param o the database row object
   * @return true on success, false on error
   */
  public static boolean disanullment(Object o) {
    Object v;
    Class<?> clazz = o.getClass();
    Class<?> czz;
    boolean result = true;
    for (Field fld : clazz.getFields()) {
      try {
	v = fld.get(o);  // wraps primitives in objects
	if (v == null) { // cannot happen with a primitive
	  czz = fld.getType();
	  if (czz == String.class) {
	    fld.set(o, new String(""));
	  } else if (czz == Long.class) {
	    fld.set(o, new Long(0));
	  } else if (czz == Integer.class) {
	    fld.set(o, new Integer(0));
	  } else if (czz == Float.class) {
	    fld.set(o, new Float(0));
	  } else if (czz == Double.class) {
	    fld.set(o, new Double(0));
	  }
	}
      } catch (Exception e) {
	result = false;
	logger.error(PerfData.ourCause(e, 3));
      }
    }
    return result;
  }

  /**
   * Look at all fields which have the default value and, if the Column
   * annotation says they can be null, set the value to null.
   * @param o object to be tweaked
   * @return true in the absence of error 
   */
  public static boolean nullification(Object o) {
    Object v;
    Class<?> clazz = o.getClass();
    Column col;
    boolean result = true;
    for (Field fld : clazz.getFields()) {
      try {
	if ( (col = fld.getAnnotation(Column.class)) == null) {
	  continue;
	}
	if (!col.nullable()) {
	  continue;
	}
	v = fld.get(o);
	if (v == null) {
	  continue;
	}
	if (v instanceof String) {
	  if (((String)v).length() <= 0) {
	    fld.set(o, null);
	  }
	} else if (v instanceof Long) {
	  if (((Long)v).longValue() == 0) {
	    fld.set(o,  null);
	  }
	} else if (v instanceof Integer) {
	  if (((Integer)v).intValue() == 0) {
	    fld.set(o,  null);
	  }
	} else if (v instanceof Float) {
	  if (((Float)v).floatValue() == 0) {
	    fld.set(o,  null);
	  }
	} else if (v instanceof Double) {
	  if (((Double)v).doubleValue() == 0) {
	    fld.set(o,  null);
	  }
	}
      } catch (Exception e) {
	result = false;
	logger.error(PerfData.ourCause(e, 3));
      }
    }
    return result;
  }
}
