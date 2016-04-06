
describe('Catalog Module', function () {
    var mockCategoryResource, $httpBackend;
    beforeEach(angular.mock.module('Catalog'));

    beforeEach(function () {
        angular.mock.inject(function ($injector) {
            $httpBackend = $injector.get('$httpBackend');
            mockCategoryResource = $injector.get('Category');
        })
    });

    describe('Get Categories', function () {

      it('should get top level categories', inject(function (Category) {
          $httpBackend.expectGET('/categories.json')
              .respond([{
              name: 'Bakery',
              id: 1,
              parent_id: null
          }]);

          var result = mockCategoryResource.query();

          $httpBackend.flush();

          expect(result[0].name).toEqual('Bakery');
      }));

      it('should get children categories', inject(function (Category) {
          $httpBackend.expectGET('/categories.json?parent_id=1')
              .respond([{
              name: 'Bread',
              id: 10,
              parent_id: 1
          }]);

          var result = mockCategoryResource.query({parent_id: 1});

          $httpBackend.flush();

          expect(result[0].name).toEqual('Bread');
      }));

    });
});
