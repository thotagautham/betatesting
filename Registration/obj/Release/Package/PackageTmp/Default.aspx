<%@ Page Title="Home Page" Language="VB"  AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="betatesting._Default" %>

<!doctype html>
<html ng-app="myApp">
    <head>
        <meta charset="utf-8">
        <title>GERIATRICS :: Vmoksha</title>
        <link rel="stylesheet" type="text/css" href="resources/css/style.css">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
        <!--<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-theme.min.css">-->
        
        <link data-require="bootstrap-css@3.1.1" data-semver="3.1.1" rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
        <script data-require="angular.js@*" data-semver="1.2.0-rc3-nonmin" src="http://code.angularjs.org/1.2.0-rc.3/angular.js"></script>
        <script data-require="bootstrap@3.1.1" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    
        <script src="resources/js/jquery.min.js"></script>
        <!--<script src="resources/js/bootstrap.js"></script>-->
		<script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery-latest.min.js"></script>
		<script src="resources/js/jquery.contact.js"></script>
        <!--<script src="resources/js/angular.min.js"></script>-->
        <script src="resources/js/jquery.maskedinput-1.2.2.min.js"></script>
        <script src="resources/js/scroll.js"></script>
        
        
        
        <!-- script for angular starts here-->
		<script>
		    var app = angular.module('myApp', []);

		    app.controller('EmployeeCtrl', ['$scope', function ($scope) {
		        $scope.currentEmp = {};
		        var currentIdx;

		        $scope.employees = [
                  { empcode: 123, empname: 'siva', addr: 'hyd', selected: false },
                      { empcode: 456, empname: 'eswar', addr: 'sec', selected: false },
                      { empcode: 789, empname: 'sankar', addr: 'sec', selected: false },
                      { empcode: 222, empname: 'allen', addr: 'blore', selected: false },
                      { empcode: 111, empname: 'smith', addr: 'delhi', selected: false },
                      { empcode: 112, empname: 'john', addr: 'usa', selected: false },
                      { empcode: 113, empname: 'bob', addr: 'chennai', selected: false },
                      { empcode: 114, empname: 'stefen', addr: 'sec', selected: false },
                      { empcode: 115, empname: 'tarun', addr: 'sec', selected: false }
		        ];

		        $scope.selectEmp = function (emp_) {
		            angular.forEach($scope.employees, function (item, key) {
		                if (!angular.equals(emp_, item)) {
		                    item.selected = false;
		                }
		            });
		            emp_.selected = !emp_.selected;
		        };

		        $scope.editEmp = function (emp_, idx_) {
		            $scope.currentEmp = angular.copy(emp_);
		            currentIdx = idx_;
		        };

		        $scope.saveEmp = function () {
		            $scope.employees[currentIdx] = $scope.currentEmp;
		        };

		        $scope.reset = function () {
		            $scope.currentEmp = angular.copy($scope.employees[currentIdx]);
		        };
		    }]);
		</script>
        <!-- script for angular ends here -->
        
        <style>
				.table {
				  border:2px solid black;
				}
				
				.modal {
				  background: #fff;
				  width: 85%;
				  height: 350px;
				  margin: auto;
				  overflow: hidden;
				}
				
				.active td {
				  background: #ccc;
				}
				
				.sorted {
				  background: #ccc;
				}
		</style>
        
    </head>

    <body>
    	
        <div ng-controller="EmployeeCtrl">	
        
            <header>
                <div class="logo">
                    <h2 title="VMoksha">VMOKSHA </h2>            
                </div>
                <div class="header-nav">
                
                        <ul class="nav-links">
                            <li> <a href="/" title="Home">Home</a> </li>
                            <li> <a href="/conact-us/" title="Contact Us">Contact Us</a> </li>
                            <li> <a href="#" title="Sign In/Register" class="login-bg">Sign In/Register </a></li>
                        </ul>
                </div>
               
                
            </header>
            <div class="header-bottom"></div>
            <div id="banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div style="height:500px; widht:750px; text-align:center; font-size:21px; padding-left:365px; padding-top:80px"><p>"IN YOUTH WE RUN INTO DIFFICULTIES. <br>
      &nbsp;&nbsp;IN OLD AGE DIFFICULTIES RUN INTO US."<br>
       - Beverly Sills</p></div>
            </div>
            
            <div class="container">
                <div class="major-services">
                
                    
                     <table width="720" border="0" cellspacing="0" cellpadding="5">
                      <tr>
                        <td width="247"><div class="health-services">
                                            <div class="health-text"><p style="padding:20px; text-align:center;" title="Health Services">HEALTH</p>
                                            </div>
                                            <a href="#" title="Click Here"><img src="resources/images/Health-1.jpg" width="247" height="180"  alt=""/></a>
                                        </div></td>
                                        
                        <td width="247"><div class="legal-services">
                                            <div class="legal-text">
                                                <p style="padding:20px; text-align:center" title="Legal Services">LEGAL</p>
                                            </div>
                                            <a href="#" title="Click Here"><img src="resources/images/Legal.jpg" width="247" height="180"  alt=""/></a>
                                         </div></td>
                                         
                        <td width="247"><div class="astro-spiritual-services">
                                        <div class="astro-text">
                                            <p style="padding:20px; text-align:center;" title="Astro &amp; Spiritual">ASTRO & SPIRITUAL</p>
                                        </div>
                                        <a href="#" title="Click Here"><img src="resources/images/Astro-&-Spiritual.jpg" width="247" height="180"  alt=""/></a>
                                        </div></td>
                      </tr>
                      <tr>
                        <td  height="31"></td>
                        <td  height="31"></td>
                        <td  height="31"></td>
                        <td  height="31"></td>
                      </tr>
    
                    <tr>                                    
                        <td width="277"><div class="pilgrim-service">
                          <div class="pilgrim-text"><p style="padding:20px; text-align:center;" title="Pilgrim Tourism">PILGRIM TOURISM</p>
                                            </div>
                                            <a href="#" title="Click Here"><img src="" width="247" height="180"  alt="pilgrim tourism image"/></a></div></td>
                         
                        <td width="247"><div class="adopt-services">
                                            <div class="adopt-text"><p style="padding:20px; text-align:center;" title="Adopt"> ADOPT</p>
                                            </div>
                                            <a href="#" title="Click Here"><img src="resources/images/adopt-1.jpg" width="247" height="180"  alt=""/></a>
                                        </div></td>     
                                        
                         <td width="247"><div class="volunteer-services">
                                            <div class="volunteer-text"><p style="padding:20px; text-align:center;" title="Volunteer Services">VOLUNTEER</p>
                                            </div>
                                            <a href="#" title="Click Here"><img src="resources/images/Volunteer-1.jpg" width="247" height="180"  alt=""/></a>
                                        </div></td>     
                                                         
                      </tr>
                      <tr>
                        <td  height="31"></td>
                        <td  height="31"></td>
                        <td  height="31"></td>
                        <td  height="31"></td>
                      </tr>
                      <tr>
                        
                                        
                        
                                        
                        <td width="247"><div class="financial-services">
                                            <div class="financial-text"><p style="padding:20px; text-align:center;" title="Financial Services">FINANCIAL</p>
                                            </div>
                                            <a href="#" title="Click Here"><img src="resources/images/Financial.jpg" width="247" height="180"  alt=""/></a>
                                        </div></td>
                                        
                        <td width="247"><div class="social-services">
                                            <div class="social-text"><p style="padding:20px; text-align:center;" title="Social Services">SOCIAL</p>
                                             </div>
                                             <a href="#" title="Click Here"><img src="resources/images/Social.jpg" width="247" height="180"  alt=""/></a>
                                        </div></td>
                          <td width="247"><div class="handyman-services">
                                            <div class="handyman-text">
                                                <p style="padding:20px; text-align:center;" title="Handyman Services">HANDYMAN SERVICES</p>
                                             </div>
                                             <a href="#" title="Click Here"><img src="resources/images/Handyman-Services.jpg" width="247" height="180" /></a>
                                        </div></td>
                      </tr>
                    </table>
                    
                 
    
                </div>
                
                <div class="body-bottom">
                    <div class="body-bottom-inner">
                        <h3 style="color:#fff;">THEY NEED YOUR SUPPORT</h3><a href="#" class="donate-now" title="Donate Now">DONATE NOW</a>
                        <p style="color:#fff; font-size:22px;">Give your unwanted goods to any Age and help support older people in need </p>
                    </div>
                </div>
                
                
            </div>
            
            <footer>
                <p>© Think Beyond Ageing® </p>
            </footer>
            
            
            <input type="text" ng-model="searchInput" /><br><br>
      <table class="table">
        <thead>
          <tr>
            <th ng-class="{'sorted': sortBy == 'empcode'}" ng-click="sortBy = 'empcode'; reverse = !reverse">Code</th>
            <th ng-class="{'sorted': sortBy == 'empname'}" ng-click="sortBy = 'empname'; reverse = !reverse">Name</th>
            <th ng-class="{'sorted': sortBy == 'addr'}" ng-click="sortBy = 'addr'; reverse = !reverse">Address</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr ng-class="{'active': emp.selected}" ng-click="selectEmp(emp)" data-ng-repeat="emp in employees | orderBy:sortBy:reverse | filter:searchInput">
            <td>{{emp.empcode}}</td>
            <td>{{emp.empname}}</td>
            <td>{{emp.addr}}</td>
            <td><a data-toggle="modal" href="#empModal" ng-click="editEmp(emp, $index)"><span class="glyphicon glyphicon-edit"></span></a></td>
          </tr>
        </tbody>
      </table>
      
      
            <div id="empModal" class="modal fade in">
        <div class="modal-header row">
          <h3 class="pull-left">Edit Employee Info </h3>
          <a class="close pull-right" data-dismiss="modal">X</a>
        </div>
        <div class="modal-body">
          <form>
            <table>
              <tr>
                <td>Code</td>
                <td><input type="text" class="form-control" ng-model="currentEmp.empcode" /></td>
              </tr>
              <tr>
                <td>Name</td>
                <td><input type="text" class="form-control" ng-model="currentEmp.empname" /></td>
              </tr>
              <tr>
                <td>Address</td>
                <td><input type="text" class="form-control" ng-model="currentEmp.addr" /></td>
              </tr>
            </table>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn" ng-click="reset()">Reset</button>
          <button class="btn" data-dismiss="modal" ng-click="saveEmp()">Save</button>
            
          </div>
      </div>
      
      
      
            
            <!--<div id="sidecontact" style="display: block; height:350px; margin-right: 0;">
                <img src="resources/images/btn-showhide_contact.gif" alt="Enquiry" title="Enquiry" />
                <iframe src="enquiry_moksha.html" width="285" height="315" frameborder="0" style="padding:15px 0px 0px 30px"></iframe>
            </div>-->
    	</div> <!-- end of ng-controller div -->
    </body>
</html>
