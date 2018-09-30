using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.ModelBinding;
using System.Web.Http.OData;
using System.Web.Http.OData.Routing;
using PMS_WebApp.Models;

namespace PMS_WebApp.Controllers
{
    /*
    The WebApiConfig class may require additional changes to add a route for this controller. Merge these statements into the Register method of the WebApiConfig class as applicable. Note that OData URLs are case sensitive.

    using System.Web.Http.OData.Builder;
    using System.Web.Http.OData.Extensions;
    using PMS_WebApp.Models;
    ODataConventionModelBuilder builder = new ODataConventionModelBuilder();
    builder.EntitySet<ExaminationType>("ExaminationTypes");
    builder.EntitySet<Customer>("Customers"); 
    builder.EntitySet<ExaminationSchedule>("ExaminationSchedules"); 
    config.Routes.MapODataServiceRoute("odata", "odata", builder.GetEdmModel());
    */
    public class ExaminationTypesController : ODataController
    {
        private PMS_WebAppContext db = new PMS_WebAppContext();

        // GET: odata/ExaminationTypes
        [EnableQuery]
        public IQueryable<ExaminationType> GetExaminationTypes()
        {
            return db.ExaminationTypes;
        }

        // GET: odata/ExaminationTypes(5)
        [EnableQuery]
        public SingleResult<ExaminationType> GetExaminationType([FromODataUri] Guid key)
        {
            return SingleResult.Create(db.ExaminationTypes.Where(examinationType => examinationType.ExaminationTypeId == key));
        }

        // PUT: odata/ExaminationTypes(5)
        public IHttpActionResult Put([FromODataUri] Guid key, Delta<ExaminationType> patch)
        {
            Validate(patch.GetEntity());

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            ExaminationType examinationType = db.ExaminationTypes.Find(key);
            if (examinationType == null)
            {
                return NotFound();
            }

            patch.Put(examinationType);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ExaminationTypeExists(key))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Updated(examinationType);
        }

        // POST: odata/ExaminationTypes
        public IHttpActionResult Post(ExaminationType examinationType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ExaminationTypes.Add(examinationType);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ExaminationTypeExists(examinationType.ExaminationTypeId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Created(examinationType);
        }

        // PATCH: odata/ExaminationTypes(5)
        [AcceptVerbs("PATCH", "MERGE")]
        public IHttpActionResult Patch([FromODataUri] Guid key, Delta<ExaminationType> patch)
        {
            Validate(patch.GetEntity());

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            ExaminationType examinationType = db.ExaminationTypes.Find(key);
            if (examinationType == null)
            {
                return NotFound();
            }

            patch.Patch(examinationType);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ExaminationTypeExists(key))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Updated(examinationType);
        }

        // DELETE: odata/ExaminationTypes(5)
        public IHttpActionResult Delete([FromODataUri] Guid key)
        {
            ExaminationType examinationType = db.ExaminationTypes.Find(key);
            if (examinationType == null)
            {
                return NotFound();
            }

            db.ExaminationTypes.Remove(examinationType);
            db.SaveChanges();

            return StatusCode(HttpStatusCode.NoContent);
        }

        // GET: odata/ExaminationTypes(5)/Customer
        [EnableQuery]
        public SingleResult<Customer> GetCustomer([FromODataUri] Guid key)
        {
            return SingleResult.Create(db.ExaminationTypes.Where(m => m.ExaminationTypeId == key).Select(m => m.Customer));
        }

        // GET: odata/ExaminationTypes(5)/ExaminationSchedules
        [EnableQuery]
        public IQueryable<ExaminationSchedule> GetExaminationSchedules([FromODataUri] Guid key)
        {
            return db.ExaminationTypes.Where(m => m.ExaminationTypeId == key).SelectMany(m => m.ExaminationSchedules);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ExaminationTypeExists(Guid key)
        {
            return db.ExaminationTypes.Count(e => e.ExaminationTypeId == key) > 0;
        }
    }
}
