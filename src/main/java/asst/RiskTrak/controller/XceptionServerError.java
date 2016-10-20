package asst.RiskTrak.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * General use server error exception
 * @author wat
 * @since 2016 10
 */
@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR, reason="Serrver error")
public class XceptionServerError extends RuntimeException{
  private static final long serialVersionUID = 1L;
}
