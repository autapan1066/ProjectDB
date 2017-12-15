using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using book_shop.Models;

namespace book_shop.Controllers
{
    public class PublishersController : Controller
    {
        private bookmodelContainer db = new bookmodelContainer();

        // GET: Publishers
        public ActionResult Index()
        {
            if (Session["UserName"].ToString() != "Admin")
            {
                return RedirectToAction("Index", "Books");
            }
            return View(db.PublisherSet.ToList());
        }

        // GET: Publishers/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["UserName"].ToString() != "Admin")
            {
                return RedirectToAction("Index", "Books");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Publisher publisher = db.PublisherSet.Find(id);
            if (publisher == null)
            {
                return HttpNotFound();
            }
            return View(publisher);
        }

        // GET: Publishers/Create
        public ActionResult Create()
        {
            if (Session["UserName"].ToString() != "Admin")
            {
                return RedirectToAction("Index", "Books");
            }
            return View();
        }

        // POST: Publishers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name")] Publisher publisher)
        {
            if (ModelState.IsValid)
            {
                db.PublisherSet.Add(publisher);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(publisher);
        }

        // GET: Publishers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["UserName"].ToString() != "Admin")
            {
                return RedirectToAction("Index", "Books");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Publisher publisher = db.PublisherSet.Find(id);
            if (publisher == null)
            {
                return HttpNotFound();
            }
            return View(publisher);
        }

        // POST: Publishers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] Publisher publisher)
        {
            if (ModelState.IsValid)
            {
                db.Entry(publisher).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(publisher);
        }

        // GET: Publishers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["UserName"].ToString() != "Admin")
            {
                return RedirectToAction("Index", "Books");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Publisher publisher = db.PublisherSet.Find(id);
            if (publisher == null)
            {
                return HttpNotFound();
            }
            return View(publisher);
        }

        // POST: Publishers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Publisher publisher = db.PublisherSet.Find(id);
            db.PublisherSet.Remove(publisher);
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
