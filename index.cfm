<html>
	<body>
		<h1>cfSeleniumWebDriver</h1>

		<cfscript>
			try {
				selenium = new cfselenium.SeleniumWebDriver(
					 driverType='firefox'
					,localDriverRepoPath=getDirectoryFromPath( getCurrentTemplatePath() ) & 'webdrivers'
				);

				driver = selenium.getDriver();

				driver.get( 'https://www.google.com/' );

				writeOutput( '<h2>Page title: #driver.getTitle()#</h2>' );

				driver.close();
				// driver.quit(); // for some reason this method fails??
			} catch( any exception ) {
				writedump( var='#exception#', label='try/catch exception', expand=1, abort=1, format='html' );
			}
		</cfscript>
	</body>
</html>
