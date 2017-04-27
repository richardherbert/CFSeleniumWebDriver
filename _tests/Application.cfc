component {
	this.name = 'testing_suite';

	this.mappings[ '/testbox' ] = expandPath( '/' ) & '../testbox';
	this.mappings[ '/_tests' ] = getDirectoryFromPath( getCurrentTemplatePath() );


	// writedump(var='#this#', label='this', expand=1, abort=1, format='html');
}
