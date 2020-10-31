extends Reference

func error_str(error: int, response_code: int = 0):
	var code_message: String = '%s ' % response_code if response_code != 0 else ''
	match response_code:
		HTTPClient.RESPONSE_CONTINUE:
			code_message += 'Continue'
		HTTPClient.RESPONSE_SWITCHING_PROTOCOLS:
			code_message += 'Switching Protocol'
		HTTPClient.RESPONSE_PROCESSING:
			code_message += 'Response Processing'

		# 2xx successful
		HTTPClient.RESPONSE_OK:
			code_message += 'OK'
		HTTPClient.RESPONSE_CREATED:
			code_message += 'Created'
		HTTPClient.RESPONSE_ACCEPTED:
			code_message += 'Accepted'
		HTTPClient.RESPONSE_NON_AUTHORITATIVE_INFORMATION:
			code_message += 'Non Authoritative Information'
		HTTPClient.RESPONSE_NO_CONTENT:
			code_message += 'No Content'
		HTTPClient.RESPONSE_RESET_CONTENT:
			code_message += 'Reset Content'
		HTTPClient.RESPONSE_PARTIAL_CONTENT:
			code_message += 'Partial Content'
		HTTPClient.RESPONSE_MULTI_STATUS:
			code_message += 'Multi Status'
		HTTPClient.RESPONSE_ALREADY_REPORTED:
			code_message += 'Already Reported'
		HTTPClient.RESPONSE_IM_USED:
			code_message += 'I\'m Used'

		# 3xx redirection
		HTTPClient.RESPONSE_MULTIPLE_CHOICES:
			code_message += 'Multiple Choices'
		HTTPClient.RESPONSE_MOVED_PERMANENTLY:
			code_message += 'Moved Permanently'
		HTTPClient.RESPONSE_FOUND:
			code_message += 'Response Found'
		HTTPClient.RESPONSE_SEE_OTHER:
			code_message += 'See Other'
		HTTPClient.RESPONSE_NOT_MODIFIED:
			code_message += 'Not Modified'
		HTTPClient.RESPONSE_USE_PROXY:
			code_message += 'Use Proxy'
		HTTPClient.RESPONSE_SWITCH_PROXY:
			code_message +=  'Switch Proxy'
		HTTPClient.RESPONSE_TEMPORARY_REDIRECT:
			code_message += 'Temporary Redirect'
		HTTPClient.RESPONSE_PERMANENT_REDIRECT:
			code_message += 'Permanent Redirect'

		# 4xx client error
		HTTPClient.RESPONSE_BAD_REQUEST:
			code_message += 'Bad Request'
		HTTPClient.RESPONSE_UNAUTHORIZED:
			code_message += 'Unauthorized'
		HTTPClient.RESPONSE_PAYMENT_REQUIRED:
			code_message += 'Payment Required'
		HTTPClient.RESPONSE_FORBIDDEN:
			code_message += 'Forbidden'
		HTTPClient.RESPONSE_NOT_FOUND:
			code_message += 'Response Not Found'
		HTTPClient.RESPONSE_METHOD_NOT_ALLOWED:
			code_message += 'Method Not Alowed'
		HTTPClient.RESPONSE_NOT_ACCEPTABLE:
			code_message += 'Not Acceptable'
		HTTPClient.RESPONSE_PROXY_AUTHENTICATION_REQUIRED:
			code_message += 'Proxy Authentication Required'
		HTTPClient.RESPONSE_REQUEST_TIMEOUT:
			code_message += 'Request Timeout'
		HTTPClient.RESPONSE_CONFLICT:
			code_message += 'Conflict'
		HTTPClient.RESPONSE_GONE:
			code_message += 'Gone'
		HTTPClient.RESPONSE_LENGTH_REQUIRED:
			code_message += 'Length Required'
		HTTPClient.RESPONSE_PRECONDITION_FAILED:
			code_message += 'Precondition Failed'
		HTTPClient.RESPONSE_REQUEST_ENTITY_TOO_LARGE:
			code_message += 'Request Entity Too Large'
		HTTPClient.RESPONSE_REQUEST_URI_TOO_LONG:
			code_message += 'Request Uri Too Long'
		HTTPClient.RESPONSE_UNSUPPORTED_MEDIA_TYPE:
			code_message += 'Unsupported Media Type'
		HTTPClient.RESPONSE_REQUESTED_RANGE_NOT_SATISFIABLE:
			code_message += 'Request Range Not Satisfiable'
		HTTPClient.RESPONSE_EXPECTATION_FAILED:
			code_message += 'Expectation Failed'
		HTTPClient.RESPONSE_IM_A_TEAPOT:
			code_message += 'I\'m a Teapot'
		HTTPClient.RESPONSE_MISDIRECTED_REQUEST:
			code_message += 'Misdirected Request'
		HTTPClient.RESPONSE_UNPROCESSABLE_ENTITY:
			code_message += 'Unprocessable Entity'
		HTTPClient.RESPONSE_LOCKED:
			code_message += 'Response Locked'
		HTTPClient.RESPONSE_FAILED_DEPENDENCY:
			code_message += 'Failed Dependency'
		HTTPClient.RESPONSE_UPGRADE_REQUIRED:
			code_message += 'Upgrade Required'
		HTTPClient.RESPONSE_PRECONDITION_REQUIRED:
			code_message += 'Precondition Required'
		HTTPClient.RESPONSE_TOO_MANY_REQUESTS:
			code_message += 'Too Many Requests'
		HTTPClient.RESPONSE_REQUEST_HEADER_FIELDS_TOO_LARGE:
			code_message += 'Request Header Fields Too Large'
		HTTPClient.RESPONSE_UNAVAILABLE_FOR_LEGAL_REASONS:
			code_message += 'Unavailable For Legal Reasons'

		# 5xx server error
		HTTPClient.RESPONSE_INTERNAL_SERVER_ERROR:
			code_message += 'Internal Server Error'
		HTTPClient.RESPONSE_NOT_IMPLEMENTED:
			code_message += 'Not Implemented'
		HTTPClient.RESPONSE_BAD_GATEWAY:
			code_message += 'Bad Gateway'
		HTTPClient.RESPONSE_SERVICE_UNAVAILABLE:
			code_message += 'Service Unavailable'
		HTTPClient.RESPONSE_GATEWAY_TIMEOUT:
			code_message += 'Gateway Timeout'
		HTTPClient.RESPONSE_HTTP_VERSION_NOT_SUPPORTED:
			code_message += 'HTTP Version Not Supported'
		HTTPClient.RESPONSE_VARIANT_ALSO_NEGOTIATES:
			code_message += 'Variant Also Negotiates'
		HTTPClient.RESPONSE_INSUFFICIENT_STORAGE:
			code_message += 'Insufficient Storage'
		HTTPClient.RESPONSE_NOT_EXTENDED:
			code_message += 'Not Extended'
		HTTPClient.RESPONSE_NETWORK_AUTH_REQUIRED:
			code_message += 'Network Auth Required'

	var result: String = 'Unkown error %s' % error
	match error:
		HTTPRequest.RESULT_SUCCESS:
			result = ''
		HTTPRequest.RESULT_BODY_SIZE_LIMIT_EXCEEDED:
			result = "Body Size Limit Exceeded"
		HTTPRequest.RESULT_SSL_HANDSHAKE_ERROR:
			result = "SSL Handshake Error"
		HTTPRequest.RESULT_REQUEST_FAILED:
			result = "Request Failed"
		HTTPRequest.RESULT_REDIRECT_LIMIT_REACHED:
			result = "Redirect Limit Reached"
		HTTPRequest.RESULT_NO_RESPONSE:
			result = "No Response"
		HTTPRequest.RESULT_DOWNLOAD_FILE_WRITE_ERROR:
			result = "Download File Write Error"
		HTTPRequest.RESULT_DOWNLOAD_FILE_CANT_OPEN:
			result = "Download File Can't Open"
		HTTPRequest.RESULT_CONNECTION_ERROR:
			result = "Connection Error"
		HTTPRequest.RESULT_CHUNKED_BODY_SIZE_MISMATCH:
			result = "Chunked Body Size Mismatch"
		HTTPRequest.RESULT_CANT_RESOLVE:
			result = "Can't Resolve Host"
		HTTPRequest.RESULT_CANT_CONNECT:
			result = "Can't Connect to Host"
		HTTPRequest.RESULT_TIMEOUT:
			result = "Timeout Connecting to Host"
	if result && code_message:
		result += ': '
	return result + code_message
