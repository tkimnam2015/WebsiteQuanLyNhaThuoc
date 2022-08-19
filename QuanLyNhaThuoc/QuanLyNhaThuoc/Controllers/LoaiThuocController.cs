using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaThuoc.Models;

namespace QuanLyNhaThuoc.Controllers
{
    public class LoaiThuocController : Controller
    {
        private QuanLyBanThuocEntities db = new QuanLyBanThuocEntities();

        // GET: LoaiThuoc
        public ActionResult Index()
        {
            return View(db.LoaiThuocs.ToList());
        }

        // GET: LoaiThuoc/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiThuoc loaiThuoc = db.LoaiThuocs.Find(id);
            if (loaiThuoc == null)
            {
                return HttpNotFound();
            }
            return View(loaiThuoc);
        }

        // GET: LoaiThuoc/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LoaiThuoc/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLoaiThuoc,TenLoaiThuoc")] LoaiThuoc loaiThuoc)
        {
            if (ModelState.IsValid)
            {
                db.LoaiThuocs.Add(loaiThuoc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loaiThuoc);
        }

        // GET: LoaiThuoc/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiThuoc loaiThuoc = db.LoaiThuocs.Find(id);
            if (loaiThuoc == null)
            {
                return HttpNotFound();
            }
            return View(loaiThuoc);
        }

        // POST: LoaiThuoc/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaLoaiThuoc,TenLoaiThuoc")] LoaiThuoc loaiThuoc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loaiThuoc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loaiThuoc);
        }

        // GET: LoaiThuoc/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiThuoc loaiThuoc = db.LoaiThuocs.Find(id);
            if (loaiThuoc == null)
            {
                return HttpNotFound();
            }
            return View(loaiThuoc);
        }

        // POST: LoaiThuoc/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LoaiThuoc loaiThuoc = db.LoaiThuocs.Find(id);
            db.LoaiThuocs.Remove(loaiThuoc);
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
