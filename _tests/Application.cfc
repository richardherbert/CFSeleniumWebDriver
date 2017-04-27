component {
	this.name = 'testing_suite';

	this.mappings[ '/testbox' ] = expandPath( '/' ) & '../testbox';
	this.mappings[ '/_tests' ] = getDirectoryFromPath( getCurrentTemplatePath() );

	this.mappings[ '/cfselenium' ] = getDirectoryFromPath( getCurrentTemplatePath() ) & '../';

	this.javaSettings = { loadPaths = [ getDirectoryFromPath( getCurrentTemplatePath() ) & '../lib/selenium-server-standalone-3.4.0.jar' ] };
}
