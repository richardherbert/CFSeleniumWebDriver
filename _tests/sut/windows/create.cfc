component extends="_tests.basetests.BaseSpecTest" {
// setup
	function beforeAll() {
		super.beforeAll();
	}

// teardown
	function afterAll() {
		super.afterAll();
	}

	function run( testResults, testBox ) {
// suite...
		describe( "Create User...", function() {
			beforeEach( function( currentSpec ) {
			});

			afterEach( function( currentSpec ) {
			});

			aroundEach( function( spec, suite ){
				arguments.spec.body();
			});

////////////////////////////////////////////////////////////////////////////////
// post user
////////////////////////////////////////////////////////////////////////////////
			it( title="...POST User (/users) with minimum payload", body=function( data ) {
				expect( true ).toBeTrue();
			}, data={} );

			it( title="...POST User (/users) with minimum payload plus new address", body=function( data ) {
				expect( true ).toBeTrue();
			}, data={} );

			it( title="...POST User (/users) with no payload", body=function( data ) {
				expect( true ).toBeTrue();
			}, data={} );

			describe( "Create User...", function() {
				it( title="...POST User (/users) with no payload", body=function( data ) {
					expect( true ).toBeTrue();
				}, data={} );
			});
		});
	}

////////////////////////////////////////////////////////////////////////////////
// common tests
////////////////////////////////////////////////////////////////////////////////

}
