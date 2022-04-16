using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TTCS.Models;

namespace TTCS.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        string url;
        static SqlConnection conn;
        static SqlDependency sqld;
        static SqlCommand cmd;
        string querry;
        static bool firsttime = true;
        public HomeController() {
            url = ConfigurationManager.ConnectionStrings["TTCS.Properties.Settings.ChuoiKN"].ConnectionString;
            querry = "SELECT[ID],[MaCK],[GiaMua1],[SoLuongMua1],[GiaMua2],[SoLuongMua2],[GiaMua3] ,[SoLuongMua3],[GiaKhop],[SoLuongKhop],[GiaBan1] ,[SoLuongBan1] ,[GiaBan2],[SoLuongBan2] ,[GiaBan3],[SoLuongBan3],[Tongso] FROM[dbo].[BangGiaTrucTuyen]";
        }
        private void DependencyOnChange(object sender, SqlNotificationEventArgs e)
        {

            if (e.Type == SqlNotificationType.Change)
            {
                sqld.OnChange -= DependencyOnChange;
                init();
                GetDB();
                Redirect();
                
            }
        }
        public void init()
        {
            conn = new SqlConnection();
            cmd = new SqlCommand(querry, conn);
            sqld = new SqlDependency(cmd);
            sqld.OnChange += new OnChangeEventHandler(DependencyOnChange);
        }
        public ActionResult Index()
        {
            return View(GetDB());
        }

        public ActionResult Redirect()
        {
            return RedirectToAction("Home", "Index");
        }

        public List<BangGiaTrucTuyen> GetDB()
        {
            if (firsttime)
                init();
            firsttime = false;
            var listTable = new List<BangGiaTrucTuyen>();
            if (conn != null && conn.State == ConnectionState.Open) conn.Close();
            try
            {
                conn.ConnectionString = url;
                conn.Open();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return null; 
            }
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                BangGiaTrucTuyen item = new BangGiaTrucTuyen();
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    var colName = reader.GetName(i);
                    var colVal = reader.GetValue(i);
                    var property = item.GetType().GetProperty(colName);
                    if (property != null && !(colVal is System.DBNull))
                    {
                        property.SetValue(item, colVal);
                    }
                }
                listTable.Add(item);
            }

            return listTable;
        }
        
       


        public List<BangGiaTrucTuyen> Get()
        {
            using(var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TTCS.Properties.Settings.ChuoiKN"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(@"SELECT [ID],[MaCK],[GiaMua1],[SoLuongMua1],[GiaMua2],[SoLuongMua2],[GiaMua3] ,[SoLuongMua3],[GiaKhop],[SoLuongKhop],[GiaBan1] ,[SoLuongBan1] ,[GiaBan2],[SoLuongBan2] ,[GiaBan3],[SoLuongBan3],[Tongso] FROM [dbo].[BangGiaTrucTuyen]", connection))
                {
                    cmd.Notification = null;
                   
                    SqlDependency dependency = new SqlDependency(cmd);
                    dependency.OnChange += new OnChangeEventHandler(dependency_onchange);
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();
                    var listTable = new List<BangGiaTrucTuyen>();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        BangGiaTrucTuyen item = new BangGiaTrucTuyen();
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            var colName = reader.GetName(i);
                            var colVal = reader.GetValue(i);
                            var property = item.GetType().GetProperty(colName);
                            if (property != null && !(colVal is System.DBNull))
                            {
                                property.SetValue(item, colVal);
                            }
                        }
                        listTable.Add(item);
                    }
                    /*var listTable = reader.Cast<IDataRecord>()
                        .Select(x => new BangGiaTrucTuyen()
                        {
                            MaCK = x.GetString(0),
                            GiaMua1 = x.GetFloat(2),
                            SoLuongMua1 = x.GetInt32(3),
                            GiaMua2 = x.GetFloat(4),
                            SoLuongMua2 = x.GetInt32(5),
                            GiaMua3 = x.GetFloat(6),
                            SoLuongMua3 = x.GetInt32(7),
                            GiaKhop = x.GetFloat(8),
                            SoLuongKhop = x.GetInt32(9),

                            GiaBan1 = x.GetFloat(10),
                            SoLuongBan1 = x.GetInt32(11),
                            GiaBan2 = x.GetFloat(12),
                            SoLuongBan2 = x.GetInt32(13),
                            GiaBan3 = x.GetFloat(14),
                            SoLuongBan3 = x.GetInt32(15),
                            TongSo = x.GetInt32(16),
            
                        }).ToList();*/
                    Console.WriteLine(listTable.Count);
                    return listTable;
                }
            }
        }

        private void dependency_onchange(object sender, SqlNotificationEventArgs e)
        {
            CusHub.Show();
        }

        // GET: Home/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Home/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Home/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Home/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Home/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Home/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Home/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
