package asst.RiskTrak.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * General use not found exception
 * @author wat
 * @since 2016 10
 */
@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="Not found")  // 404
public class XceptionNotFound extends RuntimeException {
  private static final long serialVersionUID = 1L;
}
