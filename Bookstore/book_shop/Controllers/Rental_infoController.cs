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
    public class Rental_infoController : Controller
    {
        private bookmodelContainer db = new bookmodelContainer();

        // GET: Rental_info
        public ActionResult Index()
        {
            var rental_infoSet = db.Rental_infoSet.Include(r => r.Customer);
            return View(rental_infoSet.ToList());
        }

        // GET: Rental_info/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rental_info rental_info = db.Rental_infoSet.Find(id);
            if (rental_info == null)
            {
                return HttpNotFound();
            }
            return View(rental_info);
        }
        public ActionResult Carts(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rental_info rental_info = db.Rental_infoSet.Find(id);
            if (rental_info == null)
            {
                return HttpNotFound();
            }
            return View(rental_info);
        }
        // GET: Rental_info/Details/5
        public ActionResult AddBook(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rental_info rental_info = db.Rental_infoSet.Find(id);
            List<Book> books = db.BookSet1.ToList();
            ViewData["Books"] = books;

          //  var Cart = from b in db.BookSet1 join ren in db.Rental_infoSet on b.
            if (rental_info == null)
            {
                return HttpNotFound();
            }
           
            return View(rental_info);
        } 
        //id มาจาก นร code มาจาก class อีก entity จ้า
        public ActionResult SelectBook(int Rid, int Bid)
        {
            Rental_info rental = db.Rental_infoSet.Find(Rid);
            Book book = db.BookSet1.Find(Bid);
            book.Status = "ยืม";
            rental.Book.Add(book);
            book.Rental_info.Add(rental);
            db.SaveChanges();
            return RedirectToAction("AddBook", new { id = Rid });
        }

        // GET: Rental_info/Create
        public ActionResult Create()
        {
            var eiei = Session["UserName"];
            var user = from m in db.CustomerSet where m.Cname == eiei.ToString() select m;
            ViewBag.CustomerCid = new SelectList(user, "Cid", "Cname");
            return View();
        }

        // POST: Rental_info/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Rid,Rent_date,Due_date,CustomerCid")] Rental_info rental_info)
        {
            if (ModelState.IsValid)
            {
                db.Rental_infoSet.Add(rental_info);
                db.SaveChanges();
                return RedirectToAction("AddBook", new { id = rental_info.Rid });
            }

            ViewBag.CustomerCid = new SelectList(db.CustomerSet, "Cid", "Cname", rental_info.CustomerCid);
            return RedirectToAction("Create");
        }

        // GET: Rental_info/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rental_info rental_info = db.Rental_infoSet.Find(id);
            if (rental_info == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerCid = new SelectList(db.CustomerSet, "Cid", "Cname", rental_info.CustomerCid);
            return View(rental_info);
        }

        // POST: Rental_info/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Rid,Rent_date,Due_date,CustomerCid")] Rental_info rental_info)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rental_info).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerCid = new SelectList(db.CustomerSet, "Cid", "Cname", rental_info.CustomerCid);
            return View(rental_info);
        }

        // GET: Rental_info/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rental_info rental_info = db.Rental_infoSet.Find(id);
            if (rental_info == null)
            {
                return HttpNotFound();
            }
            return View(rental_info);
        }

        // POST: Rental_info/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Rental_info rental_info = db.Rental_infoSet.Find(id);
            db.Rental_infoSet.Remove(rental_info);
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
