using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Net;
using System.IO;
using System.Text;
using Newtonsoft.Json.Linq;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class Hanlder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //添加行程
    [WebMethod]
    public static string SaveMsg(string date1,string date2, string persons, string add, string theme, string sponsor, string scale,string remark)
    {
        if (persons == "")
        {
            return "系统正在获取用户名....";
        }
        else
            
        {
            if (persons == "张艳"|| persons=="魏文华"||persons=="宗毅"||persons=="沈仕满"||persons=="吴柳荷"||persons=="王刚")
            {
                string sql = "insert into Schedule(SysDate,time,time2,users,address,theme,sponsor,scale,remark) values (GETDATE(),'" + date1 + "','" + date2 + "','" + persons + "','" + add + "','" + theme + "','" + sponsor + "','" + scale + "','" + remark + "')";
                if (SQLHelper.ExecuteNonQuery(SQLHelper.DD, System.Data.CommandType.Text, sql) > 0)
                {
                    return "写入成功";
                }
                else
                {
                    return "写入失败";
                }
            }
            else {
                return "你没有权限输入！";
            }
        }
    }
    //编辑行程
    [WebMethod]
    public static string updateSchedule(string ID, string time, string time2, string persons, string address, string theme, string sponsor, string scale, string remark)
    {

        if (persons == "")
        {
            return "系统正在获取用户名....";
        }
        else
        {
            //return "123";
            persons = persons.Trim();
            if (persons == "张艳" || persons == "魏文华" || persons == "宗毅" || persons == "沈仕满" || persons == "吴柳荷" || persons == "王刚")
            {
                string sql = "update Schedule set time='" + time.Trim() + "',time2='" + time2.Trim() + "',users='" + persons.Trim() + "',address='" + address.Trim() + "',theme='" + theme.Trim() + "',sponsor='" + sponsor.Trim() + "',scale='" + scale.Trim() + "',remark='" + remark.Trim() + "'where ID=" + ID;
                if (SQLHelper.ExecuteNonQuery(SQLHelper.DD, System.Data.CommandType.Text, sql) > 0)
                {
                    return "修改成功";
                }
                else
                {
                    return "修改失败";
                }
            }
            else
            {
                return "你没有权限修改！";
            }
        }
    }
    //删除行程
    [WebMethod]
    public static bool deleteSchedule(string ID)
    {
        string sql = "delete from Schedule where ID=" + ID;
       // sql="delete from Expressage where ID=@ID";
        //SqlParameter para=new SqlParameter("ID",ID);
        if (SQLHelper.ExecuteNonQuery(SQLHelper.DD, System.Data.CommandType.Text, sql) > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }




    [WebMethod]
    public static List<ProjectsIn> ShowDetailDD(string ID)
    {

       
        string sql = "select ID,time,time2,users,address,theme,sponsor,scale,remark from Schedule where ID="+ID;
        System.Data.DataSet sqlxialaBilldr = SQLHelper.ExecuteDataSet(SQLHelper.DD, sql, System.Data.CommandType.Text);
        List<ProjectsIn> rlist = new List<ProjectsIn>();
        if (sqlxialaBilldr.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < sqlxialaBilldr.Tables[0].Rows.Count; i++)
            {
                ProjectsIn r = new ProjectsIn();
                r.ID = sqlxialaBilldr.Tables[0].Rows[i][0].ToString();
                r.time = sqlxialaBilldr.Tables[0].Rows[i][1].ToString();
                r.time2 = sqlxialaBilldr.Tables[0].Rows[i][2].ToString();
                r.users = sqlxialaBilldr.Tables[0].Rows[i][3].ToString();
                r.address = sqlxialaBilldr.Tables[0].Rows[i][4].ToString();
                r.theme = sqlxialaBilldr.Tables[0].Rows[i][5].ToString();
                r.sponsor = sqlxialaBilldr.Tables[0].Rows[i][6].ToString();
                r.scale = sqlxialaBilldr.Tables[0].Rows[i][7].ToString();
                r.remark = sqlxialaBilldr.Tables[0].Rows[i][8].ToString();
                rlist.Add(r);
            }

        }
        return rlist;
    }

    public static string DateDiff(DateTime DateTime1, DateTime DateTime2)
    {
        string dateDiff = null;

        TimeSpan ts1 = new TimeSpan(DateTime1.Ticks);
        TimeSpan ts2 = new TimeSpan(DateTime2.Ticks);
        TimeSpan ts = ts1.Subtract(ts2).Duration();
        dateDiff = ts.Days.ToString();

        return dateDiff;
    }

    [WebMethod]
    public static string ShowDetailDDD()
    {

        string Data = "{\n";
        Data += "\"events\":[\n";
        string sql = "select ID,time,time2,users,address,theme,sponsor,scale,remark from Schedule order by  ID";
        System.Data.DataSet sqlxialaBilldr = SQLHelper.ExecuteDataSet(SQLHelper.DD, sql, System.Data.CommandType.Text);
        if (sqlxialaBilldr.Tables[0].Rows.Count > 0)
        {
            string nian = "";
            string yue = "";
            string ri = "";
            DateTime sdate = DateTime.Parse("2010-2-12 00:00:00");
            for (int i = 0; i < sqlxialaBilldr.Tables[0].Rows.Count; i++)
            {
               
               int sl = Convert.ToInt32 (DateDiff(Convert.ToDateTime(sqlxialaBilldr.Tables[0].Rows[i][1].ToString()), Convert.ToDateTime(sqlxialaBilldr.Tables[0].Rows[i][2].ToString()))) + 1;
               //if (sl == 0)
               //{
               //    string[] timeZ = sqlxialaBilldr.Tables[0].Rows[i][1].ToString().ToString().Split(' ');
               //    string[] nianZ = timeZ[0].Split('-');
               //    nian = Convert.ToInt32(nianZ[0]).ToString();
               //    yue = Convert.ToInt32(nianZ[1]).ToString();
               //    ri = Convert.ToInt32(nianZ[2]).ToString();

               //    sdate = Convert.ToDateTime(sqlxialaBilldr.Tables[0].Rows[i][1].ToString().ToString());


               //        string rr = sqlxialaBilldr.Tables[0].Rows[i][1].ToString().Split(' ')[0].ToString();
               //        Regex reg = new Regex(@"^0+");
               //        string aa = rr.Split('-')[1].ToString().Trim();
               //        string bb = rr.Split('-')[2].ToString().Trim();
               //        aa = reg.Replace(aa, "");
               //        bb = reg.Replace(bb, "");
               //        string ks = sqlxialaBilldr.Tables[0].Rows[i][1].ToString().Split(' ')[1].ToString();
               //        string js = sqlxialaBilldr.Tables[0].Rows[i][2].ToString().Split(' ')[1].ToString();
               //        Data += "{\n";
               //        Data += "\"ID\":\"" + sqlxialaBilldr.Tables[0].Rows[i][0].ToString().Trim() + "\",\n";
               //        Data += "\"time\":\"" + ks.ToString().Trim() + "\",\n";
               //        Data += "\"times\":\"" + js.ToString().Trim() + "\",\n";
               //        Data += "\"month\":\"" + yue + "\",\n";
               //        Data += "\"day\":\"" + ri + "\",\n";
               //        Data += "\"year\":\"" + nian + "\",\n";
               //        Data += "\"title\":\"" + sqlxialaBilldr.Tables[0].Rows[i][5].ToString().Trim() + "\",\n";
               //        Data += "\"area\":\"" + sqlxialaBilldr.Tables[0].Rows[i][4].ToString().Trim() + "\",\n";
               //        Data += "\"names\":\"" + sqlxialaBilldr.Tables[0].Rows[i][3].ToString().Trim() + "\"\n";
               //        Data += "},\n";
               //}
               for (int io = 0; io < sl; io++)
               {
                   if (io == 0)
                   {
                       string[] timeZ = sqlxialaBilldr.Tables[0].Rows[i][1].ToString().ToString().Split(' ');
                       string[] nianZ = timeZ[0].Split('-');
                       nian = Convert.ToInt32(nianZ[0]).ToString();
                       yue = Convert.ToInt32(nianZ[1]).ToString();
                       ri = Convert.ToInt32(nianZ[2]).ToString();

                       sdate = Convert.ToDateTime(sqlxialaBilldr.Tables[0].Rows[i][1].ToString().ToString());
                   }
                   if (io > 0)
                   {
                       string[] timeZ = sdate.ToString().Split(' ');
                       string[] nianZ = timeZ[0].Split('-');
                       nian = Convert.ToInt32(nianZ[0]).ToString();
                       yue = Convert.ToInt32(nianZ[1]).ToString();
                       ri = Convert.ToInt32(nianZ[2]).ToString();
                   }
                   //r.ID = sqlxialaBilldr.Tables[0].Rows[i][0].ToString();
                   //r.time = sqlxialaBilldr.Tables[0].Rows[i][1].ToString();
                   //r.time2 = sqlxialaBilldr.Tables[0].Rows[i][2].ToString();
                   //r.users = sqlxialaBilldr.Tables[0].Rows[i][3].ToString();
                   //r.address = sqlxialaBilldr.Tables[0].Rows[i][4].ToString();
                   //r.theme = sqlxialaBilldr.Tables[0].Rows[i][5].ToString();
                   //r.sponsor = sqlxialaBilldr.Tables[0].Rows[i][6].ToString();
                   //r.scale = sqlxialaBilldr.Tables[0].Rows[i][7].ToString();
                   //r.remark = sqlxialaBilldr.Tables[0].Rows[i][8].ToString();
                   
                       string rr = sqlxialaBilldr.Tables[0].Rows[i][1].ToString().Split(' ')[0].ToString();
                       Regex reg = new Regex(@"^0+");
                       string aa = rr.Split('-')[1].ToString().Trim();
                       string bb = rr.Split('-')[2].ToString().Trim();
                       aa = reg.Replace(aa, "");
                       bb = reg.Replace(bb, "");
                       string ks = sqlxialaBilldr.Tables[0].Rows[i][1].ToString().Split(' ')[1].ToString();
                       string js = sqlxialaBilldr.Tables[0].Rows[i][2].ToString().Split(' ')[1].ToString();
                       Data += "{\n";
                       Data += "\"ID\":\"" + sqlxialaBilldr.Tables[0].Rows[i][0].ToString().Trim() + "\",\n";
                       Data += "\"time\":\"" + ks.ToString().Trim() + "\",\n";
                       Data += "\"times\":\"" + js.ToString().Trim() + "\",\n";
                       Data += "\"month\":\"" + yue + "\",\n";
                       Data += "\"day\":\"" + ri + "\",\n";
                       Data += "\"year\":\"" + nian + "\",\n";
                       Data += "\"title\":\"" + sqlxialaBilldr.Tables[0].Rows[i][5].ToString().Trim() + "\",\n";
                       Data += "\"area\":\"" + sqlxialaBilldr.Tables[0].Rows[i][4].ToString().Trim() + "\",\n";
                       Data += "\"names\":\"" + sqlxialaBilldr.Tables[0].Rows[i][3].ToString().Trim() + "\"\n";
                       Data += "},\n";
                   
                   sdate = Convert.ToDateTime(sdate).AddDays(1);
               }
                
            }

            Data = Data.Substring(0,Data.Length - 3);
            Data += "}\n";
            Data += "]\n";
            Data += "}\n";

            return Data;
        }
        return Data;
    }

    [WebMethod]
    public static string getUserName(string Code)
    {
        objuser.WebService ws = new objuser.WebService();
        string AccessToken = ws.getAccessToken();
        //获取UserID
        string Url = "https://oapi.dingtalk.com/user/getuserinfo?access_token=" + AccessToken + "&code=" + Code;

        string UserID = ws.GETMSG(Url, "userid");
        string getUserName = "select Name from Port_Emp where No='" + UserID + "'";
        return SQLHelper.ExecuteScalar(SQLHelper.CCOA, System.Data.CommandType.Text, getUserName).ToString();
    }



    private static bool RemoteCertificateValidate(object sender, X509Certificate cert, X509Chain chain, SslPolicyErrors error)
    {
        // trust any certificate!!!
        System.Console.WriteLine("Warning, trust any certificate");
        //为了通过证书验证，总是返回true
        return true;
    }
    //private static string GETMSG(string URL, string Keys)
    //{
    //    ServicePointManager.ServerCertificateValidationCallback += RemoteCertificateValidate;
    //    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
    //    request.Method = "GET";
    //    using (WebResponse response = request.GetResponse())
    //    {

    //        using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
    //        {
    //            string Json = reader.ReadToEnd();
    //            JObject jsonAT = JObject.Parse(Json);
    //            return jsonAT[Keys].ToString();
    //        }

    //    }
    //}
}



public class ProjectsIn
{
    
    public string ID { get; set; }
    public string time { get; set; }
    public string time2 { get; set; }
    public string users { get; set; }
    public string address { get; set; }
    public string theme { get; set; }
    public string sponsor { get; set; }
    public string scale { get; set; }
    public string remark { get; set; }
   
}

public class ProjectsIn2
{

    public string ID { get; set; }
    public string SysDate { get; set; }
    public string time { get; set; }
    public string time2 { get; set; }
    public string users { get; set; }
    public string address { get; set; }
    public string theme { get; set; }
    public string sponsor { get; set; }
    public string scale { get; set; }
    public string remark { get; set; }

} 