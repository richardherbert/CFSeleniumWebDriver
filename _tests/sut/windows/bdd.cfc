component extends="_tests.basetests.BaseSpecTest" {
// setup
	function beforeAll() {
		// super.beforeAll();
	}

// teardown
	function afterAll() {
		// super.afterAll();
	}

	function run( testResults, testBox ) {
// suite...
		feature( "User", function() {
			beforeEach( function( currentSpec ) {
			});

			afterEach( function( currentSpec ) {
			});

			aroundEach( function( spec, suite ) {
				arguments.spec.body();
			});

////////////////////////////////////////////////////////////////////////////////
// post user
////////////////////////////////////////////////////////////////////////////////
			scenario( "Create User", function() {
				given( "I have entered a width of 20 and a height of 30 and a depth of 40...", function() {
					when( "I run the calculation...", function() {
						then( "the result should be 24000", function() {
							expect( true ).toBeTrue();
						});
					});
				});
			});
		});
	}

////////////////////////////////////////////////////////////////////////////////
// common tests
////////////////////////////////////////////////////////////////////////////////

}
