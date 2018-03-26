using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MobileBackend.DataAccess;

namespace MobileBackend.Controllers
{
    public class SearchController : Controller
    {
        private TimesheetEntities db = new TimesheetEntities();

        // GET: Search
        public ActionResult Index()
        {
            var workAssignments = db.WorkAssignments.Include(w => w.Customer);
            return View(workAssignments.ToList());
        }

       

        // GET: Search/Create
        public ActionResult Create()
        {
            ViewBag.Id_Customer = new SelectList(db.Customers, "Id_Customer", "CustomerName");
            return View();
        }

        // POST: Search/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_WorkAssignment,Id_Customer,Title,Description,Deadline,InProgress,InProgressAt,Completed,CompletedAt,CreatedAt,LastModifiedAt,DeletedAt,Active")] WorkAssignment workAssignment)
        {
            if (ModelState.IsValid)
            {
                db.WorkAssignments.Add(workAssignment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Customer = new SelectList(db.Customers, "Id_Customer", "CustomerName", workAssignment.Id_Customer);
            return View(workAssignment);
        }

       

        // POST: Search/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            WorkAssignment workAssignment = db.WorkAssignments.Find(id);
            db.WorkAssignments.Remove(workAssignment);
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
