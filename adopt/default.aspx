<%@ Page Title="GERIATRICS :: ADOPT SERVICES" Language="vb" AutoEventWireup="false" MasterPageFile="~/innerbasepage.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default10" %>
<%@ Register TagName="team" TagPrefix="expertsteam" Src="~/expertsteam.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="metatagscontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
   <!-- <div class="container">
    	
        <div class="col-lg-12" style=" height:auto; margin-bottom:10px;">
                
                	<div class="col-lg-5" style="background-color:#f0f0f0;">-->
                    	
                        <p style="background-color:#5a5a90;"  class="col-lg-5-title" >ADOPT FORUM</p>
                        
                        <!--<div id="tabs-under-forum">
                            <ul class="nav nav-tabs" id="myTab">
                                <li class="active"><a data-target="#talk" data-toggle="tab" href="#talk">TALK</a></li>
                                <li><a data-target="#photo" data-toggle="tab" href="#photo">PHOTO</a></li>
                                <li><a data-target="#video" data-toggle="tab" href="#video">VIDEO</a></li>
                                
                            </ul>
                                 
                            <div class="tab-content">
                                <div class="tab-pane active" id="talk">TALK INFO..</div>
                                <div class="tab-pane" id="photo">PHOTO INFO..</div>
                                <div class="tab-pane" id="video">VIDEO INFO..</div>
                            </div>
                        </div>
                        <br>-->
                        
                        <div class="media" style="background-color:#f6f7f9; border:6px solid #fff;">
                              <a class="pull-left" href="#">
                                <img src="../resources/images/adopt-1.jpg" width="110" height="85" alt="image1">
                              </a>
                              <div class="media-body">
                                <h5 class="media-heading">DICE Method helps Handling Agitation & Aggression in Dimentia</h5>
                                <p>updated soon...</p>
                              </div>
						</div>
                         
                        
                        
                        <div class="media" style="background-color:#f6f7f9; border:6px solid #fff;">
                              <a class="pull-left" href="#">
                                <img src="../resources/images/adopt-1.jpg" width="110" height="85" alt="image1">
                              </a>
                              <div class="media-body">
                                <h5 class="media-heading">DICE Method helps Handling Agitation & Aggression in Dimentia</h5>
                             <p>updated soon...</p>
                              </div>
						</div>
                            
                        
                        <div id="col-lg-5-bottom">
                        
                        	<div class="col-lg-5-bottom-heading">
                            	<h3>ADOPT</h3>
                            </div>
                            <br>
                            
                            <div class="col-lg-5-body">
                            	
                            </div>
                       
                        </div> 
                             
      </asp:Content>                         
                            
                      
     <asp:Content ID="Content3" ContentPlaceHolderID="bodycenter" runat="server">             
                        
                   <!-- </div>
                    
                    <div class="col-lg-4">-->
                    	<p style="background-color:#7e64a5;"  class="col-lg-5-title" >OUR TEAM OF EXPERTS</p>
                      	<div class="welcompagtext">
                            <expertsteam:team runat="server" ID="team1" />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                   <!-- </div>
                    
                    <div class="col-lg-3">-->
                        <!--<div style="background-color:#7e64a5;">
                        	<p style="background-color:#8a73ad;"  class="col-lg-5-title" >ADOPT AN ORPHAN</p>
                            
                            <form>
                            	<table width="100%">
                                	<tbody>
                                    	                                    
                                        <tr>
                                        	<td>
                                                <select style="width:100%; background-color: #8a73ad; color: #fff; height: 38px;">
                                                    <option >SEARCH BY  SPECIALTY</option>
                                                    <option value="updated soon">updated soon</option>
                                                    
                                                </select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                        	<td>
                                                <select style="width:100%; background-color: #8a73ad; color: #fff; height: 38px">
                                                    <option >SEARCH BY AREA</option>
                                                    <option value="Bangalore">Bangalore</option>
                                                    <option value="Hyderabad">Hyderabad</option>
                                              	</select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                           <td>
                                                <select style="width:100%; background-color: #8a73ad; color: #fff; height: 38px">
                                                    <option >SEARCH BY  NAME</option>
                                                    <option value="None">updated soon</option>
                                                    
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                        	<td align="center" style="padding: 18px;">
                                                <input type="submit" name="submit" style="background-color: #5a5a90; color:#fff;width: 107px; height: 30px; font-family:Myriad Pro;" value="SEARCH" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>

                        </div>
                            <br>-->

                        <!--<div style="background-color:#7e64a5;">

                            <p style="background-color:#8a73ad;"  class="col-lg-5-title" >ASK AN EXPERT</p>
                            
                            <form>
                                <table width="100%">
                                    <tbody>
                                                                            
                                        <tr>
                                            <td>
                                                <input style="width:100%; background-color: #8a73ad; color: #fff; height: 38px; padding-left:10px;" placeholder="NAME">
                                             
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                                <input style="width:100%; background-color: #8a73ad; color: #fff; height: 38px; padding-left:10px;" placeholder="MOBILE">

                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                                <input type="email" style="width:100%; background-color: #8a73ad; height: 38px; padding-left:10px;" placeholder="EMAIL">

                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <select style="width:100%; background-color: #8a73ad; color: #fff; height: 38px">
                                                    <option >SELECT AN EXPERT</option>
                                                    <option value="HEALTH">HEALTH</option>
                                                    <option value="LEGAL">LEGAL</option>
                                                    <option value="ASTRO & SPIRITUAL">ASTRO & SPIRITUAL</option>
                                                    <option value="PILGRIM TOURISM">PILGRIM TOURISM</option>
                                                    <option value="ADOPT">ADOPT</option>
                                                    <option value="VOLUNTEER">VOLUNTEER</option>
                                                    <option value="FINANCIAL">FINANCIAL</option>
                                                    <option value="SOCIAL">SOCIAL</option>
                                                    <option value="HANDYMAN SERVICES">HANDYMAN SERVICES</option>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <textarea placeholder="TYPE YOUR QUERY" style="width: 100%;height: 80px; background-color: #8a73ad; color:#fff; padding-left:10px;"></textarea>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="center" style="padding: 18px;">
                                                <input type="submit" name="submit" style="background-color: #5a5a90; color:#fff;width: 107px; height: 30px; font-family:Myriad Pro;" value="ASK" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                
                </div>
                
            </div> -->   
        
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderBodyRight" runat="server">
</asp:Content>
