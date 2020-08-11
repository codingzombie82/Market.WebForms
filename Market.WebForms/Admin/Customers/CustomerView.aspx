<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CustomerView.aspx.cs" Inherits="Market.WebForms.Admin.Customers.CustomerView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    회원 상세 보기</p>
<p>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CustomerID" 
        DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            CustomerID:
            <asp:Label ID="CustomerIDLabel1" runat="server" 
                Text='<%# Eval("CustomerID") %>' />
            <br />
            CustomerName:
            <asp:TextBox ID="CustomerNameTextBox" runat="server" 
                Text='<%# Bind("CustomerName") %>' />
            <br />
            Phone1:
            <asp:TextBox ID="Phone1TextBox" runat="server" Text='<%# Bind("Phone1") %>' />
            <br />
            Phone2:
            <asp:TextBox ID="Phone2TextBox" runat="server" Text='<%# Bind("Phone2") %>' />
            <br />
            Phone3:
            <asp:TextBox ID="Phone3TextBox" runat="server" Text='<%# Bind("Phone3") %>' />
            <br />
            Mobile1:
            <asp:TextBox ID="Mobile1TextBox" runat="server" Text='<%# Bind("Mobile1") %>' />
            <br />
            Mobile2:
            <asp:TextBox ID="Mobile2TextBox" runat="server" Text='<%# Bind("Mobile2") %>' />
            <br />
            Mobile3:
            <asp:TextBox ID="Mobile3TextBox" runat="server" Text='<%# Bind("Mobile3") %>' />
            <br />
            Zip:
            <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            AddressDetail:
            <asp:TextBox ID="AddressDetailTextBox" runat="server" 
                Text='<%# Bind("AddressDetail") %>' />
            <br />
            Ssn1:
            <asp:TextBox ID="Ssn1TextBox" runat="server" Text='<%# Bind("Ssn1") %>' />
            <br />
            Ssn2:
            <asp:TextBox ID="Ssn2TextBox" runat="server" Text='<%# Bind("Ssn2") %>' />
            <br />
            EmailAddress:
            <asp:TextBox ID="EmailAddressTextBox" runat="server" 
                Text='<%# Bind("EmailAddress") %>' />
            <br />
            MemberDivision:
            <asp:TextBox ID="MemberDivisionTextBox" runat="server" 
                Text='<%# Bind("MemberDivision") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="업데이트" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="취소" />
        </EditItemTemplate>
        <InsertItemTemplate>
            CustomerName:
            <asp:TextBox ID="CustomerNameTextBox" runat="server" 
                Text='<%# Bind("CustomerName") %>' />
            <br />
            Phone1:
            <asp:TextBox ID="Phone1TextBox" runat="server" Text='<%# Bind("Phone1") %>' />
            <br />
            Phone2:
            <asp:TextBox ID="Phone2TextBox" runat="server" Text='<%# Bind("Phone2") %>' />
            <br />
            Phone3:
            <asp:TextBox ID="Phone3TextBox" runat="server" Text='<%# Bind("Phone3") %>' />
            <br />
            Mobile1:
            <asp:TextBox ID="Mobile1TextBox" runat="server" Text='<%# Bind("Mobile1") %>' />
            <br />
            Mobile2:
            <asp:TextBox ID="Mobile2TextBox" runat="server" Text='<%# Bind("Mobile2") %>' />
            <br />
            Mobile3:
            <asp:TextBox ID="Mobile3TextBox" runat="server" Text='<%# Bind("Mobile3") %>' />
            <br />
            Zip:
            <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            AddressDetail:
            <asp:TextBox ID="AddressDetailTextBox" runat="server" 
                Text='<%# Bind("AddressDetail") %>' />
            <br />
            Ssn1:
            <asp:TextBox ID="Ssn1TextBox" runat="server" Text='<%# Bind("Ssn1") %>' />
            <br />
            Ssn2:
            <asp:TextBox ID="Ssn2TextBox" runat="server" Text='<%# Bind("Ssn2") %>' />
            <br />
            EmailAddress:
            <asp:TextBox ID="EmailAddressTextBox" runat="server" 
                Text='<%# Bind("EmailAddress") %>' />
            <br />
            MemberDivision:
            <asp:TextBox ID="MemberDivisionTextBox" runat="server" 
                Text='<%# Bind("MemberDivision") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="삽입" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="취소" />
        </InsertItemTemplate>
        <ItemTemplate>
            CustomerID:
            <asp:Label ID="CustomerIDLabel" runat="server" 
                Text='<%# Eval("CustomerID") %>' />
            <br />
            CustomerName:
            <asp:Label ID="CustomerNameLabel" runat="server" 
                Text='<%# Bind("CustomerName") %>' />
            <br />
            Phone1:
            <asp:Label ID="Phone1Label" runat="server" Text='<%# Bind("Phone1") %>' />
            <br />
            Phone2:
            <asp:Label ID="Phone2Label" runat="server" Text='<%# Bind("Phone2") %>' />
            <br />
            Phone3:
            <asp:Label ID="Phone3Label" runat="server" Text='<%# Bind("Phone3") %>' />
            <br />
            Mobile1:
            <asp:Label ID="Mobile1Label" runat="server" Text='<%# Bind("Mobile1") %>' />
            <br />
            Mobile2:
            <asp:Label ID="Mobile2Label" runat="server" Text='<%# Bind("Mobile2") %>' />
            <br />
            Mobile3:
            <asp:Label ID="Mobile3Label" runat="server" Text='<%# Bind("Mobile3") %>' />
            <br />
            Zip:
            <asp:Label ID="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            AddressDetail:
            <asp:Label ID="AddressDetailLabel" runat="server" 
                Text='<%# Bind("AddressDetail") %>' />
            <br />
            Ssn1:
            <asp:Label ID="Ssn1Label" runat="server" Text='<%# Bind("Ssn1") %>' />
            <br />
            Ssn2:
            <asp:Label ID="Ssn2Label" runat="server" Text='<%# Bind("Ssn2") %>' />
            <br />
            EmailAddress:
            <asp:Label ID="EmailAddressLabel" runat="server" 
                Text='<%# Bind("EmailAddress") %>' />
            <br />
            MemberDivision:
            <asp:Label ID="MemberDivisionLabel" runat="server" 
                Text='<%# Bind("MemberDivision") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="편집" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="삭제" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="새로 만들기" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" 
        InsertCommand="INSERT INTO [Customers] ([CustomerName], [Phone1], [Phone2], [Phone3], [Mobile1], [Mobile2], [Mobile3], [Zip], [Address], [AddressDetail], [Ssn1], [Ssn2], [EmailAddress], [MemberDivision]) VALUES (@CustomerName, @Phone1, @Phone2, @Phone3, @Mobile1, @Mobile2, @Mobile3, @Zip, @Address, @AddressDetail, @Ssn1, @Ssn2, @EmailAddress, @MemberDivision)" 
        SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)" 
        UpdateCommand="UPDATE [Customers] SET [CustomerName] = @CustomerName, [Phone1] = @Phone1, [Phone2] = @Phone2, [Phone3] = @Phone3, [Mobile1] = @Mobile1, [Mobile2] = @Mobile2, [Mobile3] = @Mobile3, [Zip] = @Zip, [Address] = @Address, [AddressDetail] = @AddressDetail, [Ssn1] = @Ssn1, [Ssn2] = @Ssn2, [EmailAddress] = @EmailAddress, [MemberDivision] = @MemberDivision WHERE [CustomerID] = @CustomerID">
        <SelectParameters>
            <asp:QueryStringParameter Name="CustomerID" QueryStringField="CustomerID" 
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerName" Type="String" />
            <asp:Parameter Name="Phone1" Type="String" />
            <asp:Parameter Name="Phone2" Type="String" />
            <asp:Parameter Name="Phone3" Type="String" />
            <asp:Parameter Name="Mobile1" Type="String" />
            <asp:Parameter Name="Mobile2" Type="String" />
            <asp:Parameter Name="Mobile3" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="AddressDetail" Type="String" />
            <asp:Parameter Name="Ssn1" Type="String" />
            <asp:Parameter Name="Ssn2" Type="String" />
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="MemberDivision" Type="Int32" />
            <asp:Parameter Name="CustomerID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerName" Type="String" />
            <asp:Parameter Name="Phone1" Type="String" />
            <asp:Parameter Name="Phone2" Type="String" />
            <asp:Parameter Name="Phone3" Type="String" />
            <asp:Parameter Name="Mobile1" Type="String" />
            <asp:Parameter Name="Mobile2" Type="String" />
            <asp:Parameter Name="Mobile3" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="AddressDetail" Type="String" />
            <asp:Parameter Name="Ssn1" Type="String" />
            <asp:Parameter Name="Ssn2" Type="String" />
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="MemberDivision" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</p>
<asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2">
    <EditItemTemplate>
        CustomerID:
        <asp:TextBox ID="CustomerIDTextBox" runat="server" 
            Text='<%# Bind("CustomerID") %>' />
        <br />
        UserID:
        <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
        <br />
        Password:
        <asp:TextBox ID="PasswordTextBox" runat="server" 
            Text='<%# Bind("Password") %>' />
        <br />
        BirthYear:
        <asp:TextBox ID="BirthYearTextBox" runat="server" 
            Text='<%# Bind("BirthYear") %>' />
        <br />
        BirthMonth:
        <asp:TextBox ID="BirthMonthTextBox" runat="server" 
            Text='<%# Bind("BirthMonth") %>' />
        <br />
        BirthDay:
        <asp:TextBox ID="BirthDayTextBox" runat="server" 
            Text='<%# Bind("BirthDay") %>' />
        <br />
        BirthStatus:
        <asp:TextBox ID="BirthStatusTextBox" runat="server" 
            Text='<%# Bind("BirthStatus") %>' />
        <br />
        Gender:
        <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
        <br />
        Job:
        <asp:TextBox ID="JobTextBox" runat="server" Text='<%# Bind("Job") %>' />
        <br />
        Wedding:
        <asp:TextBox ID="WeddingTextBox" runat="server" Text='<%# Bind("Wedding") %>' />
        <br />
        Hobby:
        <asp:TextBox ID="HobbyTextBox" runat="server" Text='<%# Bind("Hobby") %>' />
        <br />
        Homepage:
        <asp:TextBox ID="HomepageTextBox" runat="server" 
            Text='<%# Bind("Homepage") %>' />
        <br />
        Intro:
        <asp:TextBox ID="IntroTextBox" runat="server" Text='<%# Bind("Intro") %>' />
        <br />
        Mailing:
        <asp:TextBox ID="MailingTextBox" runat="server" Text='<%# Bind("Mailing") %>' />
        <br />
        VisitCount:
        <asp:TextBox ID="VisitCountTextBox" runat="server" 
            Text='<%# Bind("VisitCount") %>' />
        <br />
        LastVisit:
        <asp:TextBox ID="LastVisitTextBox" runat="server" 
            Text='<%# Bind("LastVisit") %>' />
        <br />
        Mileage:
        <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
        <br />
        JoinDate:
        <asp:TextBox ID="JoinDateTextBox" runat="server" 
            Text='<%# Bind("JoinDate") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="업데이트" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="취소" />
    </EditItemTemplate>
    <InsertItemTemplate>
        CustomerID:
        <asp:TextBox ID="CustomerIDTextBox" runat="server" 
            Text='<%# Bind("CustomerID") %>' />
        <br />
        UserID:
        <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
        <br />
        Password:
        <asp:TextBox ID="PasswordTextBox" runat="server" 
            Text='<%# Bind("Password") %>' />
        <br />
        BirthYear:
        <asp:TextBox ID="BirthYearTextBox" runat="server" 
            Text='<%# Bind("BirthYear") %>' />
        <br />
        BirthMonth:
        <asp:TextBox ID="BirthMonthTextBox" runat="server" 
            Text='<%# Bind("BirthMonth") %>' />
        <br />
        BirthDay:
        <asp:TextBox ID="BirthDayTextBox" runat="server" 
            Text='<%# Bind("BirthDay") %>' />
        <br />
        BirthStatus:
        <asp:TextBox ID="BirthStatusTextBox" runat="server" 
            Text='<%# Bind("BirthStatus") %>' />
        <br />
        Gender:
        <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
        <br />
        Job:
        <asp:TextBox ID="JobTextBox" runat="server" Text='<%# Bind("Job") %>' />
        <br />
        Wedding:
        <asp:TextBox ID="WeddingTextBox" runat="server" Text='<%# Bind("Wedding") %>' />
        <br />
        Hobby:
        <asp:TextBox ID="HobbyTextBox" runat="server" Text='<%# Bind("Hobby") %>' />
        <br />
        Homepage:
        <asp:TextBox ID="HomepageTextBox" runat="server" 
            Text='<%# Bind("Homepage") %>' />
        <br />
        Intro:
        <asp:TextBox ID="IntroTextBox" runat="server" Text='<%# Bind("Intro") %>' />
        <br />
        Mailing:
        <asp:TextBox ID="MailingTextBox" runat="server" Text='<%# Bind("Mailing") %>' />
        <br />
        VisitCount:
        <asp:TextBox ID="VisitCountTextBox" runat="server" 
            Text='<%# Bind("VisitCount") %>' />
        <br />
        LastVisit:
        <asp:TextBox ID="LastVisitTextBox" runat="server" 
            Text='<%# Bind("LastVisit") %>' />
        <br />
        Mileage:
        <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
        <br />
        JoinDate:
        <asp:TextBox ID="JoinDateTextBox" runat="server" 
            Text='<%# Bind("JoinDate") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="삽입" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="취소" />
    </InsertItemTemplate>
    <ItemTemplate>
        CustomerID:
        <asp:Label ID="CustomerIDLabel" runat="server" 
            Text='<%# Bind("CustomerID") %>' />
        <br />
        UserID:
        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Bind("UserID") %>' />
        <br />
        Password:
        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
        <br />
        BirthYear:
        <asp:Label ID="BirthYearLabel" runat="server" Text='<%# Bind("BirthYear") %>' />
        <br />
        BirthMonth:
        <asp:Label ID="BirthMonthLabel" runat="server" 
            Text='<%# Bind("BirthMonth") %>' />
        <br />
        BirthDay:
        <asp:Label ID="BirthDayLabel" runat="server" Text='<%# Bind("BirthDay") %>' />
        <br />
        BirthStatus:
        <asp:Label ID="BirthStatusLabel" runat="server" 
            Text='<%# Bind("BirthStatus") %>' />
        <br />
        Gender:
        <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
        <br />
        Job:
        <asp:Label ID="JobLabel" runat="server" Text='<%# Bind("Job") %>' />
        <br />
        Wedding:
        <asp:Label ID="WeddingLabel" runat="server" Text='<%# Bind("Wedding") %>' />
        <br />
        Hobby:
        <asp:Label ID="HobbyLabel" runat="server" Text='<%# Bind("Hobby") %>' />
        <br />
        Homepage:
        <asp:Label ID="HomepageLabel" runat="server" Text='<%# Bind("Homepage") %>' />
        <br />
        Intro:
        <asp:Label ID="IntroLabel" runat="server" Text='<%# Bind("Intro") %>' />
        <br />
        Mailing:
        <asp:Label ID="MailingLabel" runat="server" Text='<%# Bind("Mailing") %>' />
        <br />
        VisitCount:
        <asp:Label ID="VisitCountLabel" runat="server" 
            Text='<%# Bind("VisitCount") %>' />
        <br />
        LastVisit:
        <asp:Label ID="LastVisitLabel" runat="server" Text='<%# Bind("LastVisit") %>' />
        <br />
        Mileage:
        <asp:Label ID="MileageLabel" runat="server" Text='<%# Bind("Mileage") %>' />
        <br />
        JoinDate:
        <asp:Label ID="JoinDateLabel" runat="server" Text='<%# Bind("JoinDate") %>' />
        <br />
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT * FROM [MemberShip] WHERE ([CustomerID] = @CustomerID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="CustomerID" QueryStringField="CustomerID" 
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
