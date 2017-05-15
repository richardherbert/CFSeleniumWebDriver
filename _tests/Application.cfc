component {
	this.name = 'CFSeleniumWebDriver_ Test_Suite';

	this.mappings[ '/cfselenium' ] = getDirectoryFromPath( getCurrentTemplatePath() ) & '../';
	this.mappings[ '/_tests' ] = getDirectoryFromPath( getCurrentTemplatePath() );

	this.javaSettings = { loadPaths = [ getDirectoryFromPath( getCurrentTemplatePath() ) & '../lib/selenium-server-standalone-3.4.0.jar' ] };
}
