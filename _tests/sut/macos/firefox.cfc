component extends="_tests.basetests.BaseSpecTest" {
// setup
	function beforeAll() {
		super.beforeAll();

		var webDriverFilePathname = getDirectoryFromPath( getCurrentTemplatePath() ) & '../../../webdrivers/geckodriver-v0.16.1-macos';

		var selenium = new cfselenium.SeleniumWebDriver(
			 driverType='firefox'
			,webdriver=webDriverFilePathname
		);

		driver = selenium.getDriver();
	}

// teardown
	function afterAll() {
		super.afterAll();

		driver.quit();
	}

	function run( testResults, testBox ) {
// suite...
		describe( "Test Firefox...", function() {
			beforeEach( function( currentSpec ) {
			});

			afterEach( function( currentSpec ) {
			});

			aroundEach( function( spec, suite ){
				arguments.spec.body();
			});

////////////////////////////////////////////////////////////////////////////////
// test browser
////////////////////////////////////////////////////////////////////////////////
			it( title="...expect Google page title", body=function( data ) {
				driver.get( 'https://www.google.com/' );

				pageTitle = driver.getTitle();

				expect( pageTitle ).toBe( 'Google' );
			}, data={} );
		});
	}

////////////////////////////////////////////////////////////////////////////////
// common tests
////////////////////////////////////////////////////////////////////////////////

}
