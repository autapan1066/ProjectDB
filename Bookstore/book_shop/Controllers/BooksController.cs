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
    public class BooksController : Controller
    {
        private bookmodelContainer db = new bookmodelContainer();

        // GET: Books
        public ActionResult Index()
        {
            return View(db.BookSet1.ToList());
        }

        // GET: Books/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.BookSet1.Find(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }
        
        public ActionResult SetCategory(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.BookSet1.Find(id);
            List<Category> cates = db.CategorySet.ToList();
            ViewData["Cates"] = cates;
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        public ActionResult AddCategory(int? id, int? cid)
        {
            Book book = db.BookSet1.Find(id);
            Category acate = db.CategorySet.Find(cid);
            book.Category.Add(acate);
            acate.Book.Add(book);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = id });
        }

        public ActionResult SetAuthor(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.BookSet1.Find(id);
            List<Author> auths = db.AuthorSet.ToList();
            ViewData["Auths"] = auths;
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        public ActionResult AddAuthor(int? id, int? auid)
        {
            Book book = db.BookSet1.Find(id);
            Author anau = db.AuthorSet.Find(auid);
            book.Author.Add(anau);
            anau.Book.Add(book);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = id });
        }

        public ActionResult SetPublisher(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.BookSet1.Find(id);
            List<Publisher> pubs = db.PublisherSet.ToList();
            ViewData["Pubs"] = pubs;
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        public ActionResult AddPublisher(int? id, int? pid)
        {
            Book book = db.BookSet1.Find(id);
            Publisher apub = db.PublisherSet.Find(pid);
            book.Publisher.Add(apub);
            apub.Book.Add(book);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = id });
        }

        public ActionResult ReturnBook(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.BookSet1.Find(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            book.Status = "ว่าง";
            db.SaveChanges();
            return RedirectToAction("Index");
        }
            // GET: Books/Create
            public ActionResult Create()
        {
            return View();
        }

        // POST: Books/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Bid,Title,Status,Price")] Book book)
        {
            if (ModelState.IsValid)
            {
                db.BookSet1.Add(book);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(book);
        }

        // GET: Books/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.BookSet1.Find(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // POST: Books/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Bid,Title,Status,Price")] Book book)
        {
            if (ModelState.IsValid)
            {
                db.Entry(book).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(book);
        }

        // GET: Books/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.BookSet1.Find(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // POST: Books/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Book book = db.BookSet1.Find(id);
            db.BookSet1.Remove(book);
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
