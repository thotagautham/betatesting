<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/jmsr.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default" %>

 <asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">

<META NAME="DESCRIPTION" CONTENT="KIMS Hospitals publishes all the latest news in hospitality industry providing quality information on surgeries, operations, workshops & treatments." />
   
 <META NAME="KEYWORDS" CONTENT="best hospitals in secunderabad, best hospitals in andhra pradesh, hospitals in hyderabad and Secunderabad, best hospitals in hyderabad, top 10 hospitals in india, super speciality hospitals in india" />

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBodyLeft" runat="server">

 <div class="grid-row clearfix"></div>

<div class="page">
<div class="grid-row">
<div class="grid-col grid-col-9">




<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    
    <table>
		  <tbody>
		  
		  <tr>
            <td><label> Hospital</label></td>
            <td>               
               
                <asp:DropDownList ID="DDLBranches" runat="server" AutoPostBack="true" AppendDataBoundItems="True" onchange="showImage();" >
                                <asp:ListItem Value="0">All Hospitals</asp:ListItem>
                                </asp:DropDownList>
            </td>
             <td>&nbsp;</td>
            </tr>
            
            <tr>
            <td><label>Departments</label></td>
            <td>
                <asp:DropDownList ID="DDLDepts" runat="server"   AutoPostBack="true"  onchange="showImage();" >
                                    <asp:ListItem Value="0">All Departments</asp:ListItem>
                                 </asp:DropDownList>
              </td>
             <td>&nbsp;</td>
            </tr>
            
            
            
             <tr>
            <td><label>Specialisation</label></td>
            <td>
                <asp:DropDownList ID="DDLSpecialisation" runat="server"   AutoPostBack="true"  onchange="showImage();" >
                                    <asp:ListItem Value="0">All Specialities</asp:ListItem>
                                 </asp:DropDownList>
              </td>
             <td>&nbsp;</td>
            </tr>
            
            
            <tr>
              <td>&nbsp;</td>
            <td valign="top">
            
          
            
            
           <asp:Button ID="BtnSearch" runat="server" Text="Search" class="cus-but" OnClientClick="showImage();" style="margin:10px auto;"  />  </td>
            
            <td>&nbsp;</td> 
            
           
            
            </tr>
</tbody>
</table>
    
    

    

<div id="divdoctors" style="padding-top:30px;"> 
    <asp:Repeater ID="RptDoctors" runat="server">
              <ItemTemplate>
                  
                 <article class="widget blog-post">	
                  <div style="border:1px solid #03ABD4; margin:0 10px;">
                  <div class="media-spec">	
                  <div style="float:left;">											
							<asp:Label ID="LblBranch" runat="server" Text='<%# Eval("Branchid")%>'></asp:Label><br/>
								<asp:Label ID="Label1" runat="server" Text='<%# FormatDateTime(Eval("NewsDate"), 1)%>'></asp:Label>
								</div>
								<div class="media-img">
								<img src="../MediaFiles/newspaperlogo/<%# Eval("NewsPaperLogo") %>"/>
								</div>
								
							</div>
       							<div class="pic">       							
                                           <a href='<%# Eval("PDFName")%>' target="_blank"><img src="../MediaFiles/thumbnail/<%# Eval("ImageURL") %>" /></a>
                                   </div>  
                                
                                <div class="typography" style="background-color:#F5F5F5; color:#fff; padding:10px;">
								<h3><asp:Label ID="LblDepartment" runat="server" Text='<%# Eval("DEPARTMENTid")%>'></asp:Label>
</h3>
								
								<p><asp:Label ID="LblSpeciality" runat="server" Text='<%# Eval("Specialisation")%>'></asp:Label>  </p>
								</div>   
                                   
                                      
                     </div>                      
                                          
                      <br/>          
                          
                      </article>          	
                               
						
              
                  
                  
              </ItemTemplate>
          </asp:Repeater>

        </div>
<asp:Label ID="LblDeptId" runat="server" Text="0" Visible="false"></asp:Label>
        </ContentTemplate>
     </asp:UpdatePanel>
 <script language="javascript">
     function showImage() {
         document.getElementById('divdoctors').innerHTML = "<img src='/images/ajax-loader.gif' />"
     }
  </script>






</div>
<div class="grid-col grid-col-3">

     <section class="widget widget-sevices">
<ul>
	      
            <li><i class="fa fa-caret-right"></i><a href="/doctor-videos/" >Doctor Videos</a></li>
            <li><i class="fa fa-caret-right"></i><a href="/patient-experience.aspx">Patient Experiences</a></li>
            <li><i class="fa fa-caret-right"></i><a href="/contactus.aspx" >Contact Us</a></li>

        </ul>
        </section>
   
       
</div>
</div>
</div>
</asp:Content>



