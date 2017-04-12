using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Name = Request.QueryString["Name"];
       //Response.Write("<script>alert('"+Name+"')</script>");
        
        //Persons.Value = Name;
        Persons.Value = Name;
       //Response.Write("<script>alert('" + Riqi + "')</script>");
        //Riqi.Value = Riqi;
        string Riqis = Request.QueryString["Riqi"];
        Riqi.Value = Riqis;
        string Yuefens=Request.QueryString["Yuefen"];

        Yuefen.Value = Yuefens;

        string corpids = Request.QueryString["corpid"];
        corpid.Value = corpids;
        //Response.Write("<script>alert('" + Riqis + "')</script>");
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    if (Persons.Value == "")
    //    {
    //        Response.Write("<script>alert('系统正在获取用户名....')</script>");
    //    }
    //    else
    //    {
    //        if (Persons.Value == "张艳")
    //        {
                
    //            string date1 = Date1.Value;
    //            string date2 = Date2.Value;
    //            string persons = Persons.Value;
    //            string add = Address.Value;
    //            string theme = Theme.Value;
    //            string sponsor = Sponsor.Value;
    //            string scale = Scale.Value;
    //            string remark = Remark.Value;
    //            string sql = "insert into schedule(SysDate,time,time2,users,address,theme,sponsor,scale,remark) values (GETDATE(),'" + date1 + "','" + date2 + "','" + persons + "','" + add + "','" + theme + "','" + sponsor + "','" + scale + "','" + remark + "')";
    //            if (SQLHelper.ExecuteNonQuery(SQLHelper.DD, System.Data.CommandType.Text, sql) > 0)
    //            {
    //                Response.Write("<script>alert('写入成功')</script>");
    //            }
    //            else
    //            {
    //                Response.Write("<script>alert('写入失败')</script>");
    //            }
    //        }
    //        else {
    //            Response.Write("你没有权限输入！");
    //        }
    //    }
    //}
}