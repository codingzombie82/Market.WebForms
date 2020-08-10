<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Market.WebForms.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<script language="Javascript" type="text/javascript">
    // 우편번호 검색 페이지 오픈
    function OpenGetZipCode(Zip, Address) {
        window.open('./GetZipCode.aspx?Zip=' + Zip + '&Address=' + Address, '', 'width=400,height=300,scrollbars=yes');
        return false; // 서버컨트롤이 포스트백이 일어나지 않도록
    }

    // 아이디 중복 검사 페이지 오픈
    function OpenCheckID() {
        window.open('./CheckID.aspx?txtUserID=<%= txtUserID.ClientID %>', '', 'width=400,height=200');
        return false;
    }
</script>

<table border="0" cellpadding="5" width="100%">
    <tr>
        <td>
            <h3>
                회원가입</h3>
            <span><span style="font-size: 9pt; color: #ff0000">회원 가입 - 다음 필드들을 채워주세요.
            </span>
                <hr width="100%" size="1">
                <span color="#ff0000">
                    <br />
                </span>
                <table id="Table1" style="border-collapse: collapse" bordercolor="black" cellspacing="0"
                    rules="none" width="575" align="center" bgcolor="white">
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                <span color="#ff0000">*</span>아이디 :
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtUserID" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                MaxLength="10" Width="150px" BorderColor="InactiveCaptionText"></asp:TextBox><font
                                    face="굴림">&nbsp;
                                    <asp:Button ID="btnCheckID" runat="server" BorderWidth="1px" BorderStyle="Groove"
                                        Width="122px" BorderColor="InactiveCaptionText" Text="아이디 중복 확인" CausesValidation="False"
                                        OnClick="btnCheckID_Click" 
                                        OnClientClick="return OpenCheckID();"></asp:Button></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                <span color="#ff0000">*</span>비밀번호 :
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtPassword" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                MaxLength="10" Width="150px" BorderColor="InactiveCaptionText" TextMode="Password"></asp:TextBox><font
                                    face="굴림">&nbsp; 비밀번호 확인 :
                                    <asp:TextBox ID="txtPasswordConfirm" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                        MaxLength="10" Width="150px" BorderColor="InactiveCaptionText" TextMode="Password"></asp:TextBox></span><font
                                            face="굴림">&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                <span color="#ff0000">*</span>이 &nbsp;름 :
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtCustomerName" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                MaxLength="10" Width="150px" BorderColor="InactiveCaptionText"></asp:TextBox><font
                                    face="굴림">&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                이메일 :
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtEmailAddress" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                Width="150px" BorderColor="InactiveCaptionText"></asp:TextBox><span>&nbsp;
                                    <asp:CheckBox ID="chkMailing" runat="server" Text="메일링 가입"></asp:CheckBox></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                <span color="#ff0000">*</span>주민번호 :
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtSsn1" runat="server" BorderWidth="1px" BorderStyle="Solid" MaxLength="10"
                                Width="120px" BorderColor="InactiveCaptionText"></asp:TextBox>-
                            <asp:TextBox ID="txtSsn2" runat="server" BorderWidth="1px" BorderStyle="Solid" MaxLength="10"
                                Width="120px" BorderColor="InactiveCaptionText"></asp:TextBox><span>&nbsp;
                                    <asp:Button ID="btnSsn" runat="server" BorderWidth="1px" 
                                BorderStyle="Groove" Width="122px"
                                        BorderColor="InactiveCaptionText" Text="주민번호 중복 확인" CausesValidation="False"
                                        OnClick="btnSsn_Click" Visible="False"></asp:Button></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                전화번호 :
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtPhone1" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                MaxLength="10" Width="50px" BorderColor="InactiveCaptionText"></asp:TextBox>-
                            <asp:TextBox ID="txtPhone2" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                MaxLength="10" Width="50px" BorderColor="InactiveCaptionText"></asp:TextBox>-
                            <asp:TextBox ID="txtPhone3" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                MaxLength="10" Width="50px" BorderColor="InactiveCaptionText"></asp:TextBox><font
                                    face="굴림">&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                휴대폰 :
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtMobile1" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                MaxLength="10" Width="50px" BorderColor="InactiveCaptionText"></asp:TextBox>-
                            <asp:TextBox ID="txtMobile2" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                MaxLength="10" Width="50px" BorderColor="InactiveCaptionText"></asp:TextBox>-
                            <asp:TextBox ID="txtMobile3" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                MaxLength="10" Width="50px" BorderColor="InactiveCaptionText"></asp:TextBox><font
                                    face="굴림">&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                <span color="#ff0000">*</span>우편번호 :
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtZip" runat="server" BorderWidth="1px" BorderStyle="Solid" MaxLength="10"
                                Width="150px" BorderColor="InactiveCaptionText"></asp:TextBox>
                            <input type="button" value="우편번호 검색" 
                                onclick="OpenGetZipCode('<%= txtZip.ClientID %>','<%= txtAddress.ClientID %>');" />                                
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                <span color="#ff0000">*</span> 집주소 :
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtAddress" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                Width="90%" BorderColor="InactiveCaptionText"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                나머지 주소&nbsp;:
                            </p>
                        </td>
                        <td width="475">
                            <asp:TextBox ID="txtAddressDetail" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                Width="240px" BorderColor="InactiveCaptionText"></asp:TextBox><span>&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                생년월일 :
                            </p>
                        </td>
                        <td width="475">
                            <span>
                                <asp:TextBox ID="txtBirthYear" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                    MaxLength="10" Width="50px" BorderColor="InactiveCaptionText"></asp:TextBox>년
                                <asp:TextBox ID="txtBirthMonth" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                    MaxLength="10" Width="50px" BorderColor="InactiveCaptionText"></asp:TextBox>월
                                <asp:TextBox ID="txtBirthDay" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                    MaxLength="10" Width="50px" BorderColor="InactiveCaptionText"></asp:TextBox>일&nbsp;
                                <asp:RadioButtonList ID="lstBirthStatus" runat="server" Width="144px" RepeatDirection="Horizontal"
                                    RepeatLayout="Flow">
                                    <asp:ListItem Value="양">양력</asp:ListItem>
                                    <asp:ListItem Value="음">음력</asp:ListItem>
                                </asp:RadioButtonList>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                직 업 :
                            </p>
                        </td>
                        <td width="475">
                            <span>
                                <asp:DropDownList ID="lstJob" runat="server">
                                    <asp:ListItem Value="직업선택" Selected="True">직업선택</asp:ListItem>
                                    <asp:ListItem Value="회사원">회사원</asp:ListItem>
                                    <asp:ListItem Value="백수">백수</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                홈페이지 :
                            </p>
                        </td>
                        <td width="475">
                            <span>
                                <asp:TextBox ID="txtHomepage" runat="server" BorderWidth="1px" BorderStyle="Solid"
                                    Width="192px" BorderColor="InactiveCaptionText"></asp:TextBox>&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                취 미 :
                            </p>
                        </td>
                        <td width="475">
                            <span>
                                <asp:TextBox ID="txtHobby" runat="server" BorderWidth="1px" BorderStyle="Solid" MaxLength="10"
                                    Width="104px" BorderColor="InactiveCaptionText"></asp:TextBox>&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef">
                            <p align="right">
                                결 혼 :
                            </p>
                        </td>
                        <td width="475">
                            <span>
                                <asp:RadioButtonList ID="lstWedding" runat="server" Width="144px" RepeatDirection="Horizontal"
                                    RepeatLayout="Flow">
                                    <asp:ListItem Value="0" Selected="True">미혼</asp:ListItem>
                                    <asp:ListItem Value="1">기혼</asp:ListItem>
                                </asp:RadioButtonList>
                                &nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="100" bgcolor="#efefef" style="height: 22px">
                            <p align="right">
                                성 별&nbsp;:
                            </p>
                        </td>
                        <td width="475" style="height: 22px">
                            <span>
                                <asp:RadioButtonList ID="lstGender" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Selected="True">남자</asp:ListItem>
                                    <asp:ListItem Value="2">여자</asp:ListItem>
                                </asp:RadioButtonList>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#efefef">
                            <p align="right">
                                소 개 :
                            </p>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIntro" runat="server" BorderWidth="1px" BorderStyle="Solid" Width="90%"
                                BorderColor="InactiveCaptionText" TextMode="MultiLine" Rows="10" Height="64px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <p>
                </p>
                <p align="center">
                    <a href="list.aspx"></a>
                </p>
                <p align="center">
                    <asp:Button ID="btnRegister" runat="server" BorderWidth="1px" BorderStyle="Groove"
                        Width="80px" BorderColor="InactiveCaptionText" Text="회원가입" OnClick="btnRegister_Click">
                    </asp:Button><span>&nbsp;</span><span>&nbsp;</span><asp:Button
                        ID="btnDefault" runat="server" BorderWidth="1px" BorderStyle="Groove" Width="80px"
                        BorderColor="InactiveCaptionText" Text="취소" CausesValidation="False" OnClick="btnDefault_Click">
                    </asp:Button></p>
                <p align="center">
                    <asp:Label ID="lblDisplay" runat="server" ForeColor="Red"></asp:Label></p>
                <p align="center">
                    <asp:RequiredFieldValidator ID="valUserID" runat="server" ErrorMessage="아이디를 입력하세요."
                        ControlToValidate="txtUserID" Display="None"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="valPassword" runat="server" ErrorMessage="비밀번호를 입력하세요."
                        ControlToValidate="txtPassword" Display="None"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="valPasswordConfirm" runat="server" ErrorMessage="비밀번호를 확인하세요."
                        ControlToValidate="txtPassword" Display="None" ControlToCompare="txtPasswordConfirm"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="valCustomerName" runat="server" ErrorMessage="이름을 입력하세요."
                        ControlToValidate="txtCustomerName" Display="None"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="valSsn1" runat="server" ErrorMessage="주민등록번호 앞자리를 입력하세요."
                        ControlToValidate="txtSsn1" Display="None"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="valSsn2" runat="server" ErrorMessage="주민등록번호 뒷자리를 입력하세요."
                        ControlToValidate="txtSsn2" Display="None"></asp:RequiredFieldValidator>
                            <span>
                                <asp:RequiredFieldValidator ID="valJob" runat="server" ControlToValidate="lstJob"
                                    ErrorMessage="직업을 선택해 주세요." InitialValue="직업선택" Display="None"></asp:RequiredFieldValidator></span>
                        </p>
                <p align="center">
                    <asp:ValidationSummary ID="valSummary" runat="server" ShowSummary="False" ShowMessageBox="True"
                        DisplayMode="List"></asp:ValidationSummary>
                </p>
                <p>
                    <span></span>&nbsp;</p>
            </span>
        </td>
    </tr>
</table>


</asp:Content>
