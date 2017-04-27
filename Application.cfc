component {
	this.name = 'cfSeleniumWebDriver';

	this.javaSettings = { loadPaths = [ getDirectoryFromPath( getCurrentTemplatePath() ) & 'lib/selenium-server-standalone-3.4.0.jar' ] };
	this.mappings[ '/cfselenium' ] = getDirectoryFromPath( getCurrentTemplatePath() );
}
