<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyInfo.aspx.cs" Inherits="SchoolWeb.MyInfo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="col-xl-12 col-md-12 col-sm-12">
                    <div class="contact_form">
                        <div id="message"></div>
                        <form id="contactform" class=""  name="contactform">
                            <div class="row row-fluid">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label for="first_name" style="color:aliceblue">First Name</label>
                                    <input disabled type="text" name="first_name" runat="server" id="first_name" class="form-control" placeholder="First Name">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label for="first_name" style="color:aliceblue">Last Name</label>
                                    <input disabled type="text" name="last_name" runat="server" id="last_name" class="form-control" placeholder="Last Name">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label for="first_name" style="color:aliceblue">Fathet Name</label>
                                    <input type="text" disabled name="last_name" runat="server" id="father_name" class="form-control" placeholder="Father Name">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label for="first_name" style="color:aliceblue">Mother Name</label>
                                    <input type="text" name="last_name" disabled runat="server" id="mother_name" class="form-control" placeholder="Mother Name">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label for="first_name" style="color:aliceblue">Birthdate</label>
                                    <input type="email"  runat="server"  id="birthdate" disabled class="form-control" placeholder="birhtdate">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label for="first_name" style="color:aliceblue">UserName</label>
                                    <input type="text" name="phone" runat="server"  id="username" disabled class="form-control" placeholder="username">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label for="first_name" style="color:aliceblue">Your Grade</label>
                                    <input type="text" name="phone" runat="server"  id="grade" class="form-control" disabled placeholder="grade">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label for="first_name" style="color:aliceblue">Your ClassRoom</label>
                                    <input type="text" name="phone" runat="server"  id="classroom" class="form-control"  disabled>
                                </div>

                            </div>
                        </form>
                    </div>
                </div><!-- end col -->
				
</asp:Content>
