using MobileBackend.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TimesheetMobile.Models;

namespace MobileBackend.Controllers
{
    public class WorkAssignmentController : ApiController
    {
        public string[] GetAll()
        {
            string[] assignmentNames = null;
            TimesheetEntities entities = new TimesheetEntities();
            try
            {
                assignmentNames = (from wa in entities.WorkAssignments
                                   where (wa.Active == true)
                                   select wa.Title).ToArray();
            }
            finally
            {
                entities.Dispose();
            }

            return assignmentNames;
        }

        [HttpPost]
        public bool PostStatus(WorkAssignmentOperationModel input)
        {
            TimesheetEntities entities = new TimesheetEntities();
            try
            {
                WorkAssignment assignment = (from wa in entities.WorkAssignments
                                             where (wa.Active == true) &&
                                             (wa.Title == input.AssignmentTitle)
                                             select wa).FirstOrDefault();

                if (assignment == null)
                {
                    return false;
                }

                int assignmentId = assignment.Id_WorkAssignment;

                Timesheet newEntry = new Timesheet()
                {
                    Id_WorkAssignment = assignmentId,
                    StartTime = DateTime.Now,
                    Active = true,
                    CreatedAt = DateTime.Now
                };
                entities.Timesheets.Add(newEntry);
                entities.SaveChanges();
            }
            catch
            {
                return false;
            }
            finally
            {
                entities.Dispose();
            }

            return true;
        }
    }
}
