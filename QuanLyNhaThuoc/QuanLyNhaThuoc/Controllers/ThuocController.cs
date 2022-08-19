using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaThuoc.Models;
using PagedList;

namespace QuanLyNhaThuoc.Controllers
{
    public class ThuocController : Controller
    {
        private QuanLyBanThuocEntities db = new QuanLyBanThuocEntities();

        // GET: Thuoc
        public ActionResult Index(string currentFilter, int? page, int MaLt = 0, string SearchString = "")
        {
            if (SearchString != "")
            {

                int pageNumber = (page ?? 1);
                var thuoc = db.Thuocs.Include(s => s.LoaiThuoc).Where(s => s.TenThuoc.ToLower().Contains(SearchString.ToLower())).OrderBy(x => x.TenThuoc);
                int pagesize = thuoc.Count();
                return View(thuoc.ToPagedList(pageNumber, pagesize));
            }
            else
            {
                SearchString = currentFilter;
            }
            ViewBag.CurrentFilter = SearchString;
            if (MaLt == 0)
            {
                int pagesize = 12;
                int pageNumber = (page ?? 1);
                var thuoc = db.Thuocs.ToList().OrderBy(x => x.TenThuoc);
                return View(thuoc.ToPagedList(pageNumber, pagesize));
            }
            else
            {
                int pageNumber = (page ?? 1);
                var sanPham = db.Thuocs.Include(s => s.LoaiThuoc).Where(m => m.MaLoaiThuoc == MaLt).OrderBy(x => x.TenThuoc).ToList();
                int pagesize = sanPham.Count();
                return View(sanPham.ToPagedList(pageNumber, pagesize));
            }
        }

        // GET: Thuoc/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Thuoc thuoc = db.Thuocs.Find(id);
            if (thuoc == null)
            {
                return HttpNotFound();
            }
            return View(thuoc);
        }

        // GET: Thuoc/Create
        public ActionResult Create()
        {
            ViewBag.MaLoaiThuoc = new SelectList(db.LoaiThuocs, "MaLoaiThuoc", "TenLoaiThuoc");
            return View();
        }

        // POST: Thuoc/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaThuoc,TenThuoc,DonViTinh,DonGia,MaLoaiThuoc,HinhThuoc")] Thuoc thuoc)
        {
            if (ModelState.IsValid)
            {
                db.Thuocs.Add(thuoc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLoaiThuoc = new SelectList(db.LoaiThuocs, "MaLoaiThuoc", "TenLoaiThuoc", thuoc.MaLoaiThuoc);
            return View(thuoc);
        }

        // GET: Thuoc/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Thuoc thuoc = db.Thuocs.Find(id);
            if (thuoc == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoaiThuoc = new SelectList(db.LoaiThuocs, "MaLoaiThuoc", "TenLoaiThuoc", thuoc.MaLoaiThuoc);
            return View(thuoc);
        }

        // POST: Thuoc/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaThuoc,TenThuoc,DonViTinh,DonGia,MaLoaiThuoc,HinhThuoc")] Thuoc thuoc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(thuoc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaLoaiThuoc = new SelectList(db.LoaiThuocs, "MaLoaiThuoc", "TenLoaiThuoc", thuoc.MaLoaiThuoc);
            return View(thuoc);
        }

        // GET: Thuoc/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Thuoc thuoc = db.Thuocs.Find(id);
            if (thuoc == null)
            {
                return HttpNotFound();
            }
            return View(thuoc);
        }

        // POST: Thuoc/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Thuoc thuoc = db.Thuocs.Find(id);
            db.Thuocs.Remove(thuoc);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}
