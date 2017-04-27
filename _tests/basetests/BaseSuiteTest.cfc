component extends="testbox.system.BaseSpec" {
// setup
	function beforeAll() {
		if ( reFindNoCase(".dev$", cgi.HTTP_HOST) == 0 ) {
			var protocol = "https";
		} else {
			var protocol = "http";
		}

		variables.version = "2";
		variables.mediaType = "json";

		variables.baseURL = "#protocol#://#cgi.HTTP_HOST#/";
	}

// teardown
	function afterAll() {
	}

/////////////////////////////////////////////////////////////////////
// common methods
/////////////////////////////////////////////////////////////////////
	private any function getHTTPServiceResponse
	(
		required string uri,
		required string verb,
		array headers=[],
		array params=[],
		string charset="utf-8"
	)
	{
		var httpService = new http();

		httpService["getParams"] = getHTTPParams;	// extend the http function with a getParams() method

		httpService.setURL( arguments.uri );
		httpService.setMethod( arguments.verb );

		httpService.setCharset( arguments.charset );

		for ( var header in arguments.headers ) {
			httpService.addParam( type="header", name=header.name, value=header.value );
		}
		if ( arguments.verb == "PATCH" ) {
			if (arguments.params.len() > 0) {
				httpService.addParam( type="body", value=arguments.params[1] );
			}
		} else {
			for ( var param in arguments.params ) {
				httpService.addParam( type="formfield", name=param.name, value=param.value );
			}
		}

		return httpService.send().getPrefix();
	}

	private array function getHTTPParams()
		output=false
		hint="return the params from the http function"
	{
		return variables.parameters;
	}

	private any function parseResponse(required string fileContent) {
		var jsonUtil = new _tests.JSONUtil();

		if ( isJson( arguments.fileContent ) ) {
			return jsonUtil.deserializeFromJSON( arguments.fileContent );
		}
		else if ( isXML( arguments.fileContent ) ) {
			return arguments.fileContent;
		}
	}

	private array function getAllEntities(required string uri, required array headers) {
		var response = getHTTPServiceResponse(arguments.uri, "GET", arguments.headers);
		statusTest( response, "200" );

		return parseResponse( response.fileContent );
	}

	private void function statusTest
	(
		required struct response,
		required string expectedStatus,
		any context={}
	)
	{
		// Status Headers tests
		if (arguments.response.responseHeader.status_code != arguments.expectedStatus) {
			debug( var=arguments.response, label="Failed statusTest()" );
		}
		expect( arguments.response.responseHeader.status_code )
		.toBe(
			arguments.expectedStatus,
			"Returned: " & arguments.response.responseHeader.explanation
		);

		// Body Content tests
		expect( arguments.response.filecontent ).notToBe( "Connection Failure" );
	}

	function createRandomUser(required struct nameValuePairs) {
		var params = [];
		for ( var name in arguments.nameValuePairs ) {
			params.append( {name: name, value: arguments.nameValuePairs[name]} );
		}

		var response = getHTTPServiceResponse( variables.baseURL & "users", "POST", headers, params );
		statusTest( response, "201" );

		return parseResponse( response.fileContent );
	}

	struct function createMinimalRandomUser() {
		var randomValue = dateTimeFormat( now(), "yymmddHHnnssl" );

		var values = {"firstName": "Joe"
			,"familyName": "Bloggs-#randomValue#"
			,"email": "joe.bloggs-#randomValue#@example.com"
		};

		var result = {};
		result.values = values;
		result.entity = createRandomUser( values );

		return result;
	}


	function getUser(required string id) {
		var response = getHTTPServiceResponse( variables.baseURL & "users/#arguments.id#", "GET", headers );

		return parseResponse( response.fileContent );
	}


	function createRandomAddress(required struct nameValuePairs) {
		var params = [];
		for ( var name in arguments.nameValuePairs ) {
			params.append( {name: name, value: arguments.nameValuePairs[name]} );
		}

		var response = getHTTPServiceResponse( variables.baseURL & "addresses", "POST", headers, params );
		statusTest( response, "201" );

		return parseResponse( response.fileContent );
	}

	struct function createMinimalRandomAddress(required string userID) {
		var randomValue = dateTimeFormat( now(), "yymmddHHnnssl" );

		var values = {
			 "checked"						: "1"
			,"enteredByID"					: "2"
			,"localityID"					: "3"
			,"orgID"						: "4"
			,"updatedByID"					: "5"
			,"checkedBy"					: "Joe"
			,"address1"						: "Address1"
			,"address2"						: "Address2"
			,"address3"						: "Address3"
			,"address4"						: "Address4"
			,"address5"						: "Address5"
			,"address6"						: "Address6"
			,"address7"						: "Address7"
			,"county"						: "county"
			,"city"							: "city"
			,"postcode"						: "postcode"
			,"addressCountry2LCode"			: "UK"
			,"addressCountryOther"			: "#randomValue#-addressCountryOther"
			,"url"							: "#randomValue#-url"
			,"abcamAccountID"				: "6"
			,"orgID_"						: "7"
			,"orgName"						: "8"
			,"preferredShippingMethodID"	: "9"

            ,"userID"                        : arguments.userID
		};

		var result = {};

		result.values = values;
		result.entity = createRandomAddress( values );

		return result;
	}

	function createRandomContactDetail(required struct nameValuePairs) {
		var params = [];

		for ( var name in arguments.nameValuePairs ) {
			params.append( {name: name, value: arguments.nameValuePairs[name]} );
		}

		var response = getHTTPServiceResponse( variables.baseURL & "contactdetails", "POST", headers, params );
		statusTest( response, "201" );

		return parseResponse( response.fileContent );
	}


	struct function createMinimalRandomContactDetail() {
			var randomValue = dateTimeFormat( now(), "yymmddHHnnssl" );

			var user = createMinimalRandomUser();

			var values = {
				 "label"		: "work email"
				,"detail"		: "joe.bloggs@example.com"
				,"type"			: "email"
				,"userID"		: user.entity.id
				,"priority"		: false
			};

			var result = {};

			result.values = values;
			result.entity = createRandomContactDetail( values );

			return result;
		}


	function testSubset(skip, take, endpoint) {
		var response = getHTTPServiceResponse(
			variables.baseURL & "#arguments.endpoint#?skip=#arguments.skip#&take=#arguments.take#",
			"GET",
			headers
		);
		statusTest( response, "200" );

		var entities = parseResponse( response.fileContent );
		expect(entities).toBeArray();
		expect(entities).toHaveLength( arguments.take );

		var largerTake = getAllEntities(
			variables.baseURL & "#arguments.endpoint#?take=#arguments.skip + arguments.take#",
			headers
		);
		expect( largerTake ).toBeArray().toHaveLength( arguments.skip + arguments.take );

		for ( var counter = 1; counter <= arguments.take; counter++ ) {
			expect( entities[counter] ).toBe( largerTake[counter + arguments.skip] );
		}

		return entities;
	}
}
