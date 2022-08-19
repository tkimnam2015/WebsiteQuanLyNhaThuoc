using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaThuoc.Models;
using System.Data.Entity;

namespace QuanLyNhaThuoc.Controllers
{
    public class HomeController : Controller
    {
        QuanLyBanThuocEntities db = new QuanLyBanThuocEntities();
        public ActionResult Index()
        {
            var thuocs = db.Thuocs.Include(t => t.LoaiThuoc);
            return View(thuocs.ToList());
            //var thuoc = db.Thuocs.ToList();
            //return View(thuoc);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}