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
		describe( "Firefox tests...", function() {
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
			it( title="...get the page title", body=function( data ) {
				driver.get( 'https://richardherbert.github.io/CFSeleniumWebDriver/' );

				pageTitle = driver.getTitle();

				expect( pageTitle ).toBe( 'CFSeleniumWebDriver' );
			}, data={} );

			it( title="...get the current URL", body=function( data ) {
				driver.get( 'https://richardherbert.github.io/CFSeleniumWebDriver/' );

				currentURL = driver.getCurrentUrl();

				expect( currentURL ).toBe( 'https://richardherbert.github.io/CFSeleniumWebDriver/' );
			}, data={} );

			it( title="...find an element by ID", body=function( data ) {
				driver.get( 'https://richardherbert.github.io/CFSeleniumWebDriver/' );

				element = driver.findElementById( 'cfseleniumwebdriver' );

				expect( element.getText() ).toBe( 'CFSeleniumWebDriver' );
			}, data={} );

			it( title="...find an element by it's link text", body=function( data ) {
				driver.get( 'https://richardherbert.github.io/CFSeleniumWebDriver/' );

				element = driver.findElementByLinkText( 'Test Subject' );

				expect( element.getTagName() ).toBe( 'a' );
				expect( element.getText() ).toBe( 'Test Subject' );
				expect( element.getAttribute( 'title' ) ).toBe( 'Test Subject' );
				expect( element.getAttribute( 'href' ) ).toBe( 'https://richardherbert.github.io/CFSeleniumWebDriver/test-subject' );
			}, data={} );

			it( title="...navigate to a new page by the text of a link", body=function( data ) {
				driver.get( 'https://richardherbert.github.io/CFSeleniumWebDriver/' );

				element = driver.findElementByLinkText( 'Test Subject' );

				element.click();
				// driver.findElement( 'id="helloTitle"' );


				// sleep( 3000 );


				driver.waitForElementVisible( 'id', 'helloTitle', 2000 );

				pageTitle = driver.getTitle();

				expect( pageTitle ).toBe( 'CFSeleniumWebDriver | Test Subject' );
			}, data={} );
		});
	}

////////////////////////////////////////////////////////////////////////////////
// common tests
////////////////////////////////////////////////////////////////////////////////

}
