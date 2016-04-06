
describe('Catalog Module', function () {

  beforeEach(angular.mock.module('Catalog'));

  describe('Catalog Resource', function() {
    var mockCategoryResource, $httpBackend;

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

  // describe('CategoriesCtrl', function() {
  //   var $controller;

  //   beforeEach(inject(function(_$controller_){
  //     $controller = _$controller_;
  //     mockCategoryResource = $injector.get('Category');
  //   }));

  //   describe('$scope.getCategories', function() {
  //     it('Uses getCategories to get categories', function() {
  //       var $scope = {};
  //       var controller = $controller('CategoriesCtrl', { $scope: $scope, Category: Category });
  //       var result = $scope.getCategories();
  //       console
  //       expect(result.length).toBeGreaterThan(1);
  //       console.log($scope.getCategories());
  //       // expect($scope.strength).toEqual('strong');
  //     });
  //   });
  // });
});
