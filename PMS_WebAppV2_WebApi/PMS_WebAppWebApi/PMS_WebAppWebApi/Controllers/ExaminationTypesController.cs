﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using PMS_WebAppWebApi.Models;

namespace PMS_WebAppWebApi.Controllers
{
    public class ExaminationTypesController : ApiController
    {
        private PMS_EduEntities db = new PMS_EduEntities();

        // GET: api/ExaminationTypes
        [Route("api/GetExaminationTypes")]
        public IQueryable<ExaminationType> GetExaminationTypes()
        {
            return db.ExaminationTypes;
        }

        // GET: api/ExaminationTypes/5
        [ResponseType(typeof(ExaminationType))]
        [Route("api/GetExaminationType")]
        public IHttpActionResult GetExaminationType(Guid id)
        {
            ExaminationType examinationType = db.ExaminationTypes.Find(id);
            if (examinationType == null)
            {
                return NotFound();
            }

            return Ok(examinationType);
        }

        // PUT: api/ExaminationTypes/5
        [ResponseType(typeof(void))]
        [Route("api/PutExaminationType")]
        public IHttpActionResult PutExaminationType(Guid id, ExaminationType examinationType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != examinationType.ExaminationTypeId)
            {
                return BadRequest();
            }

            db.Entry(examinationType).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ExaminationTypeExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/ExaminationTypes
        [ResponseType(typeof(ExaminationType))]
        [Route("api/PostExaminationType")]
        public IHttpActionResult PostExaminationType(ExaminationType examinationType)
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

            return CreatedAtRoute("DefaultApi", new { id = examinationType.ExaminationTypeId }, examinationType);
        }

        // DELETE: api/ExaminationTypes/5
        [ResponseType(typeof(ExaminationType))]
        [Route("api/DeleteExaminationType")]
        public IHttpActionResult DeleteExaminationType(Guid id)
        {
            ExaminationType examinationType = db.ExaminationTypes.Find(id);
            if (examinationType == null)
            {
                return NotFound();
            }

            db.ExaminationTypes.Remove(examinationType);
            db.SaveChanges();

            return Ok(examinationType);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ExaminationTypeExists(Guid id)
        {
            return db.ExaminationTypes.Count(e => e.ExaminationTypeId == id) > 0;
        }
    }
}