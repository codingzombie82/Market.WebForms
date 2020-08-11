using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Market.WebForms
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            System.Web.UI.ValidationSettings.UnobtrusiveValidationMode =
                System.Web.UI.UnobtrusiveValidationMode.WebForms;

            //[1] 
            Application["CurrentVisit"] = 0; // 현재 사용자
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //[2] 한명의 사용자가 들어올 때마다 카운트 1씩 증가
            Application.Lock();
            Application["CurrentVisit"] = (int)Application["CurrentVisit"] + 1;
            Application.UnLock();
            // 사용자 방문 카운트를 DB에 저장 : 시간대별로 1개 레코드 생성

            (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteNonQuery(System.Data.CommandType.Text, "AddCounter");
        }

        protected void Session_End(object sender, EventArgs e)
        {
            //[3] 한명의 사용자가 나간 후 20분후에 카운트 1씩 감소
            Application.Lock();
            Application["CurrentVisit"] = (int)Application["CurrentVisit"] - 1;
            Application.UnLock();
        }
    }
}