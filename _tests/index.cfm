<html>
	<body>
		<h1>Test Suite</h1>

		<ul>
			<li><a href="./test-runner.cfm">test-runner</a></li>
			<li><a href="./test-browser.cfm">test-browser</a></li>
		</ul>

		<!--- <cfdump var='#cgi#' label='' expand='0' abort='0' format='html'> --->

<!---
<cfset r = new testbox.system.TestBox( directory="coldbox.testing.cases.testing.specs" ) >
<cfoutput>#r.run()#</cfoutput>
--->


<!---
<cfscript>
// Create TestBox object
testbox = new testbox.system.TestBox();

// You can add fluent specs via addDirectory(), addDirectories(), addBundles()
// testbox.addDirectory( "/tests" );

// Run tests and produce reporter results
// testbox.run()

// Run tests and get raw testbox.system.TestResults object
// testbox.runRaw()

// Run tests and produce reporter results from SOAP, REST, HTTP
testbox.runRemote("/tests/create")



</cfscript>
--->

	</body>
</html>
