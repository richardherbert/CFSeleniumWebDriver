component extends="_tests.basetests.BaseSpecTest" {
// setup
	function beforeAll() {
		super.beforeAll();

// https://github.com/mozilla/geckodriver/releases
		var webDriverFilePathname = getDirectoryFromPath( getCurrentTemplatePath() ) & '../../../webdrivers/geckodriver-v0.16.1-win64.exe';

		var selenium = new cfselenium.SeleniumWebDriver(
			 driverType='firefox'
			,webdriver=webDriverFilePathname
		);

		driver = selenium.getDriver();
	}

// teardown
	function afterAll() {
		super.afterAll();

		driver.close();
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
			it( title="...expect documentation page title", body=function( data ) {
				driver.get( 'https://richardherbert.github.io/CFSeleniumWebDriver/' );

				pageTitle = driver.getTitle();

				expect( pageTitle ).toBe( 'CFSeleniumWebDriver' );
			}, data={} );
		});
	}

////////////////////////////////////////////////////////////////////////////////
// common tests
////////////////////////////////////////////////////////////////////////////////

}
