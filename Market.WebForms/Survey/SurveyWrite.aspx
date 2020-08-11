<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SurveyWrite.aspx.cs" Inherits="Market.WebForms.Survey.SurveyWrite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

설문 등록(관리자)&nbsp;<asp:FormView ID="FormView1" runat="server" DataKeyNames="SurveyID"
	DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted">
	<EditItemTemplate>
		SurveyID:
		<asp:Label ID="SurveyIDLabel1" runat="server" Text='<%# Eval("SurveyID") %>'></asp:Label><br />
		Name:
		<asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'>
		</asp:TextBox><br />
		Email:
		<asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>'>
		</asp:TextBox><br />
		Title:
		<asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>'>
		</asp:TextBox><br />
		OptionCount:
		<asp:TextBox ID="OptionCountTextBox" runat="server" Text='<%# Bind("OptionCount") %>'>
		</asp:TextBox><br />
		OptionType:
		<asp:TextBox ID="OptionTypeTextBox" runat="server" Text='<%# Bind("OptionType") %>'>
		</asp:TextBox><br />
		CreatedDate:
		<asp:TextBox ID="CreatedDateTextBox" runat="server" Text='<%# Bind("CreatedDate") %>'>
		</asp:TextBox><br />
		Password:
		<asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>'>
		</asp:TextBox><br />
		Option1:
		<asp:TextBox ID="Option1TextBox" runat="server" Text='<%# Bind("Option1") %>'>
		</asp:TextBox><br />
		Option2:
		<asp:TextBox ID="Option2TextBox" runat="server" Text='<%# Bind("Option2") %>'>
		</asp:TextBox><br />
		Option3:
		<asp:TextBox ID="Option3TextBox" runat="server" Text='<%# Bind("Option3") %>'>
		</asp:TextBox><br />
		Option4:
		<asp:TextBox ID="Option4TextBox" runat="server" Text='<%# Bind("Option4") %>'>
		</asp:TextBox><br />
		Option5:
		<asp:TextBox ID="Option5TextBox" runat="server" Text='<%# Bind("Option5") %>'>
		</asp:TextBox><br />
		Option6:
		<asp:TextBox ID="Option6TextBox" runat="server" Text='<%# Bind("Option6") %>'>
		</asp:TextBox><br />
		Option7:
		<asp:TextBox ID="Option7TextBox" runat="server" Text='<%# Bind("Option7") %>'>
		</asp:TextBox><br />
		Option8:
		<asp:TextBox ID="Option8TextBox" runat="server" Text='<%# Bind("Option8") %>'>
		</asp:TextBox><br />
		Option9:
		<asp:TextBox ID="Option9TextBox" runat="server" Text='<%# Bind("Option9") %>'>
		</asp:TextBox><br />
		<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
			Text="업데이트">
		</asp:LinkButton>
		<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
			Text="취소">
		</asp:LinkButton>
	</EditItemTemplate>
	<InsertItemTemplate>
		작성자:
		<asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>(어느
		관리자가 설문을 등록했는지)<br />
		Email:
		<asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>(설문
		등록자 이메일)<br />
		설문제목:
		<asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox><br />
		설문 문항수:
		<asp:TextBox ID="OptionCountTextBox" runat="server" Text='<%# Bind("OptionCount") %>'></asp:TextBox>(2문항~9문항)<br />
		중복선택가능:
		<asp:TextBox ID="OptionTypeTextBox" runat="server" Text='<%# Bind("OptionType") %>'></asp:TextBox>(0:중복불가,1:중복가능)<br />
		설문등록일:
		<asp:TextBox ID="CreatedDateTextBox" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:TextBox><br />
		설문수정용암호:
		<asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox><br />
		Option1:
		<asp:TextBox ID="Option1TextBox" runat="server" Text='<%# Bind("Option1") %>'></asp:TextBox><br />
		Option2:
		<asp:TextBox ID="Option2TextBox" runat="server" Text='<%# Bind("Option2") %>'></asp:TextBox><br />
		Option3:
		<asp:TextBox ID="Option3TextBox" runat="server" Text='<%# Bind("Option3") %>'></asp:TextBox><br />
		Option4:
		<asp:TextBox ID="Option4TextBox" runat="server" Text='<%# Bind("Option4") %>'></asp:TextBox><br />
		Option5:
		<asp:TextBox ID="Option5TextBox" runat="server" Text='<%# Bind("Option5") %>'></asp:TextBox><br />
		Option6:
		<asp:TextBox ID="Option6TextBox" runat="server" Text='<%# Bind("Option6") %>'></asp:TextBox><br />
		Option7:
		<asp:TextBox ID="Option7TextBox" runat="server" Text='<%# Bind("Option7") %>'></asp:TextBox><br />
		Option8:
		<asp:TextBox ID="Option8TextBox" runat="server" Text='<%# Bind("Option8") %>'></asp:TextBox><br />
		Option9:
		<asp:TextBox ID="Option9TextBox" runat="server" Text='<%# Bind("Option9") %>'></asp:TextBox><br />
		<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
			Text="삽입"></asp:LinkButton>
		<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
			Text="취소"></asp:LinkButton>
	</InsertItemTemplate>
	<ItemTemplate>
		SurveyID:
		<asp:Label ID="SurveyIDLabel" runat="server" Text='<%# Eval("SurveyID") %>'></asp:Label><br />
		Name:
		<asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label><br />
		Email:
		<asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>'></asp:Label><br />
		Title:
		<asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>'></asp:Label><br />
		OptionCount:
		<asp:Label ID="OptionCountLabel" runat="server" Text='<%# Bind("OptionCount") %>'></asp:Label><br />
		OptionType:
		<asp:Label ID="OptionTypeLabel" runat="server" Text='<%# Bind("OptionType") %>'></asp:Label><br />
		CreatedDate:
		<asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:Label><br />
		Password:
		<asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>'></asp:Label><br />
		Option1:
		<asp:Label ID="Option1Label" runat="server" Text='<%# Bind("Option1") %>'></asp:Label><br />
		Option2:
		<asp:Label ID="Option2Label" runat="server" Text='<%# Bind("Option2") %>'></asp:Label><br />
		Option3:
		<asp:Label ID="Option3Label" runat="server" Text='<%# Bind("Option3") %>'></asp:Label><br />
		Option4:
		<asp:Label ID="Option4Label" runat="server" Text='<%# Bind("Option4") %>'></asp:Label><br />
		Option5:
		<asp:Label ID="Option5Label" runat="server" Text='<%# Bind("Option5") %>'></asp:Label><br />
		Option6:
		<asp:Label ID="Option6Label" runat="server" Text='<%# Bind("Option6") %>'></asp:Label><br />
		Option7:
		<asp:Label ID="Option7Label" runat="server" Text='<%# Bind("Option7") %>'></asp:Label><br />
		Option8:
		<asp:Label ID="Option8Label" runat="server" Text='<%# Bind("Option8") %>'></asp:Label><br />
		Option9:
		<asp:Label ID="Option9Label" runat="server" Text='<%# Bind("Option9") %>'></asp:Label><br />
		<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
			Text="편집"></asp:LinkButton>
		<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
			Text="삭제"></asp:LinkButton>
		<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
			Text="새로 만들기"></asp:LinkButton>
	</ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
	DeleteCommand="DELETE FROM [Surveys] WHERE [SurveyID] = @SurveyID" InsertCommand="INSERT INTO [Surveys] ([Name], [Email], [Title], [OptionCount], [OptionType], [CreatedDate], [Password], [Option1], [Option2], [Option3], [Option4], [Option5], [Option6], [Option7], [Option8], [Option9]) VALUES (@Name, @Email, @Title, @OptionCount, @OptionType, @CreatedDate, @Password, @Option1, @Option2, @Option3, @Option4, @Option5, @Option6, @Option7, @Option8, @Option9)"
	SelectCommand="SELECT [SurveyID], [Name], [Email], [Title], [OptionCount], [OptionType], [CreatedDate], [Password], [Option1], [Option2], [Option3], [Option4], [Option5], [Option6], [Option7], [Option8], [Option9] FROM [Surveys]"
	UpdateCommand="UPDATE [Surveys] SET [Name] = @Name, [Email] = @Email, [Title] = @Title, [OptionCount] = @OptionCount, [OptionType] = @OptionType, [CreatedDate] = @CreatedDate, [Password] = @Password, [Option1] = @Option1, [Option2] = @Option2, [Option3] = @Option3, [Option4] = @Option4, [Option5] = @Option5, [Option6] = @Option6, [Option7] = @Option7, [Option8] = @Option8, [Option9] = @Option9 WHERE [SurveyID] = @SurveyID">
	<DeleteParameters>
		<asp:Parameter Name="SurveyID" Type="Int32" />
	</DeleteParameters>
	<UpdateParameters>
		<asp:Parameter Name="Name" Type="String" />
		<asp:Parameter Name="Email" Type="String" />
		<asp:Parameter Name="Title" Type="String" />
		<asp:Parameter Name="OptionCount" Type="Int32" />
		<asp:Parameter Name="OptionType" Type="Byte" />
		<asp:Parameter Name="CreatedDate" Type="DateTime" />
		<asp:Parameter Name="Password" Type="String" />
		<asp:Parameter Name="Option1" Type="String" />
		<asp:Parameter Name="Option2" Type="String" />
		<asp:Parameter Name="Option3" Type="String" />
		<asp:Parameter Name="Option4" Type="String" />
		<asp:Parameter Name="Option5" Type="String" />
		<asp:Parameter Name="Option6" Type="String" />
		<asp:Parameter Name="Option7" Type="String" />
		<asp:Parameter Name="Option8" Type="String" />
		<asp:Parameter Name="Option9" Type="String" />
		<asp:Parameter Name="SurveyID" Type="Int32" />
	</UpdateParameters>
	<InsertParameters>
		<asp:Parameter Name="Name" Type="String" />
		<asp:Parameter Name="Email" Type="String" />
		<asp:Parameter Name="Title" Type="String" />
		<asp:Parameter Name="OptionCount" Type="Int32" />
		<asp:Parameter Name="OptionType" Type="Byte" />
		<asp:Parameter Name="CreatedDate" Type="DateTime" />
		<asp:Parameter Name="Password" Type="String" />
		<asp:Parameter Name="Option1" Type="String" />
		<asp:Parameter Name="Option2" Type="String" />
		<asp:Parameter Name="Option3" Type="String" />
		<asp:Parameter Name="Option4" Type="String" />
		<asp:Parameter Name="Option5" Type="String" />
		<asp:Parameter Name="Option6" Type="String" />
		<asp:Parameter Name="Option7" Type="String" />
		<asp:Parameter Name="Option8" Type="String" />
		<asp:Parameter Name="Option9" Type="String" />
	</InsertParameters>
</asp:SqlDataSource>


</asp:Content>
