using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaThuoc.Models;

namespace QuanLyNhaThuoc.Controllers
{
    public class GioHangController : Controller
    {
        private QuanLyBanThuocEntities db = new QuanLyBanThuocEntities();
        // GET: GioHang
        public ActionResult Index()
        {
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            return View(giohang);
        }
        //public RedirectToRouteResult AddToCart(int MT)
        //{
        //    if (Session["giohang"] == null)//chưa có giỏ
        //    {
        //        Session["giohang"] = new List<CartItem>();
        //    }
        //    List<CartItem> giohang = Session["giohang"] as List<CartItem>;
        //    if (giohang.FirstOrDefault(m => m.MaThuoc == MT) == null)
        //    {
        //        Thuoc t = db.Thuocs.Find(MT);
        //        CartItem item = new CartItem();
        //        item.MaThuoc = MT;
        //        item.TenThuoc = t.TenThuoc;
        //        item.DonGia = Convert.ToDouble(t.DonGia);
        //        item.SoLuong = 1;
        //        giohang.Add(item);
        //    }
        //    else //sp co trong gio > 1
        //    {
        //        CartItem item = giohang.FirstOrDefault(m => m.MaThuoc == MT);
        //        item.SoLuong++;
        //    }
        //    Session["giohang"] = giohang;
        //    return RedirectToAction("Index");

        //}
        public RedirectToRouteResult AddToCart(int maThuoc)
        {
            if (Session["giohang"] == null)//chưa có giỏ
            {
                Session["giohang"] = new List<CartItem>();
            }
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            if (giohang.FirstOrDefault(m => m.MaThuoc == maThuoc) == null)
            {
                Thuoc sp = db.Thuocs.Find(maThuoc);
                CartItem item = new CartItem();
                item.MaThuoc = maThuoc;
                item.TenThuoc = sp.TenThuoc;
                item.DonGia = (double)sp.DonGia;
                item.SoLuong = 1;
                giohang.Add(item);
            }
            else
            {
                CartItem item = giohang.FirstOrDefault(m => m.MaThuoc == maThuoc);
                item.SoLuong++;
            }
            Session["cart"] = giohang;
            return RedirectToAction("Index");
        }
        public RedirectToRouteResult Update(int maSP, int txtSoLuong)
        {
            List<CartItem> cart = Session["cart"] as List<CartItem>;

            CartItem item = cart.FirstOrDefault(m => m.MaThuoc == maSP);
            if (item != null)
            {
                item.SoLuong = txtSoLuong;
                Session["cart"] = cart;
            }

            return RedirectToAction("Index");
        }
        public RedirectToRouteResult Delete(int maThuoc)
        {
            List<CartItem> cart = Session["cart"] as List<CartItem>;

            CartItem item = cart.FirstOrDefault(m => m.MaThuoc == maThuoc);
            if (item != null)
            {
                cart.Remove(item);
                Session["cart"] = cart;
            }

            return RedirectToAction("Index");
        }
    }
}