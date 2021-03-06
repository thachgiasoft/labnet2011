﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LabnetClient.Models;
using DataRepository;
using AutoMapper;
using DomainModel;
using DomainModel.Constant;
using LibraryFuntion;

namespace LabnetClient.Controllers
{
    public class BacSiController : BaseController
    {
        //
        // GET: /Doctor/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Doctor/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Doctor/Create

        public ActionResult Create()
        {
            DoctorViewModel model = new DoctorViewModel();
            model.Doctor.IsActive = true;
            return View("Create", model);
        } 

        //
        // POST: /Doctor/Create

        [HttpPost]
        public ActionResult Create(DoctorViewModel model)
        {
            if (!Repository.IsValidDoctor(model.Doctor.Name))
            {
                ModelState.AddModelError("Doctor name already exists", Resources.DoctorStrings.DoctorInsert_ErrorExist);
            }

            if (!ModelState.IsValid)
            {
                return View("Create", model);
            }

            Doctor doctor = Mapper.Map<VMDoctor, Doctor>(model.Doctor);
            Repository.DoctorInsert(doctor);

            model = new DoctorViewModel();
            model.Doctor.IsActive = true;

            //return RedirectToAction("Create");
            model.ViewMode = ViewMode.Edit;
            return RedirectToAction("Edit", new { id = doctor.Id });
            
        }

        [HttpPost]
        public string SaveDoctor(List<VMTestListItem> Rows)
        {
            Session[SessionProperties.SessionDoctorList] = Rows;

            return "success";
        }
        
        //
        // GET: /Doctor/Edit/5
 
        public ActionResult Edit(int id)
        {
            DoctorViewModel model = new DoctorViewModel();

            model.Doctor = Mapper.Map<Doctor, VMDoctor>(Repository.GetDoctor(id));
            model.ViewMode = ViewMode.Edit;
            
            return View("Create", model);
        }

        //
        // POST: /Doctor/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, DoctorViewModel model)
        {
            DoctorSearchViewModel mol = (DoctorSearchViewModel)Session[SessionProperties.SessionDoctorList];
            Repository.DoctorUpdate(id, Mapper.Map<VMDoctor, Doctor>(model.Doctor));
            return RedirectToAction("Edit", id);
            
        }

        public ActionResult Search()
        {
            DoctorSearchViewModel model = new DoctorSearchViewModel();
            model.DoctorSearch.ListSearchResult = new List<DoctorSearchObject>();
            return View("Search", model);
        }


        [HttpPost]
        public ActionResult Search(DoctorSearchViewModel model)
        {
            List<Doctor> lstDoctor = Repository.GetDoctorByName(model.DoctorSearch.Name);
            model.DoctorSearch.ListSearchResult = new List<DoctorSearchObject>();
            foreach (Doctor doctor in lstDoctor)
            {
                DoctorSearchObject obj = new DoctorSearchObject();
                obj.Id = doctor.Id;
                obj.DoctorName = doctor.Name;
                obj.Email = doctor.Email;
                obj.ConnectionCode = string.IsNullOrEmpty(doctor.ConnectionCode) ? "Chưa Tạo" : doctor.ConnectionCode;
                obj.DoctorConnectName = string.IsNullOrEmpty(doctor.DoctorConnectName) ? "" : doctor.DoctorConnectName;
                model.DoctorSearch.ListSearchResult.Add(obj);
            }
            
            JQGridModel grid = new JQGridModel(typeof(DoctorSearchObject), false, model.DoctorSearch.ListSearchResult, "");
            return View("DataTable", grid);
            //return View("Search", model);
        }

        [HttpPost]
        public ActionResult SearchDoctor(string filterText, bool isActive)
        {
            List<Doctor> lstDoctor = Repository.GetDoctorByNameForSearch(filterText, isActive);
            List<DoctorSearchObject> ListSearchResult = new List<DoctorSearchObject>();
            foreach (Doctor doctor in lstDoctor)
            {
                DoctorSearchObject obj = new DoctorSearchObject();
                obj.Id = doctor.Id;
                obj.DoctorName = doctor.Name;
                obj.Email = doctor.Email;
                obj.ConnectionCode = string.IsNullOrEmpty(doctor.ConnectionCode) ? "Chưa Tạo" : doctor.ConnectionCode;
                obj.IsConnected = doctor.IsConnected ? "Kết Nối" : "Chưa";
                obj.DoctorConnectName = string.IsNullOrEmpty(doctor.DoctorConnectName) ? "" : doctor.DoctorConnectName;
                obj.IsActive = doctor.IsActive ? "Kích Hoạt" : "Chưa Kích Hoạt";
                ListSearchResult.Add(obj);
            }
            DoctorSearchViewModel model = new DoctorSearchViewModel();
            model.DoctorSearch.ListSearchResult = ListSearchResult;
            model.DoctorSearch.Name = filterText;
            model.IsActive = isActive;
            Session[SessionProperties.SessionSearchDoctor] = model;
            JQGridModel grid = new JQGridModel(typeof(DoctorSearchObject), false, ListSearchResult, "");
            return View("DataTable", grid);
        }

        [HttpPost]
        public ActionResult Search(string filterText)
        {
            List<VMDoctor> lstDoctor = Mapper.Map<List<Doctor>, List<VMDoctor>>(Repository.GetDoctorByName(filterText));
            JQGridModel model = new JQGridModel(typeof(VMPanel), false, lstDoctor, "");
            return View("DataTable", model);
        }
       

        [HttpPost]
        public string CreateConnectionCode(int doctorId)
        {
            AjaxResultModel result = new AjaxResultModel();
            try
            {
                int labId = (int)Session["LabId"];
                string connectionCode = Repository.CreateConnectionCode(doctorId, labId);
                result.IsSuccess = true;
                result.ResponseData = connectionCode;
            }
            catch(Exception ex) 
            {
                result.IsSuccess = false;
                result.ErrorMessage = ex.Message;
            }
            return result.ToJson();
        }

        [HttpPost]
        public string RemoveConnection(int doctorId)
        {

            AjaxResultModel result = new AjaxResultModel();
            try
            {
                Repository.RemoveConnection(doctorId,LabId);
                result.IsSuccess = true;
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.ErrorMessage = ex.Message;
            }
            return result.ToJson();
        }

        
        public ActionResult BackToSearch()
        {
            DoctorSearchViewModel mol = (DoctorSearchViewModel)Session[SessionProperties.SessionSearchDoctor];
            bool isActive = true;
            string filterText = "";
            if (mol != null)
            {
                filterText = mol.DoctorSearch.Name;
                isActive = mol.IsActive;
            }

            List<Doctor> lstDoctor = Repository.GetDoctorByNameForSearch(filterText, isActive);
            List<DoctorSearchObject> ListSearchResult = new List<DoctorSearchObject>();
            foreach (Doctor doctor in lstDoctor)
            {
                DoctorSearchObject obj = new DoctorSearchObject();
                obj.Id = doctor.Id;
                obj.DoctorName = doctor.Name;
                obj.Email = doctor.Email;
                obj.ConnectionCode = string.IsNullOrEmpty(doctor.ConnectionCode) ? "Chưa Tạo" : doctor.ConnectionCode;
                obj.IsConnected = doctor.IsConnected ? "Kết Nối" : "Chưa";
                obj.DoctorConnectName = string.IsNullOrEmpty(doctor.DoctorConnectName) ? "" : doctor.DoctorConnectName;
                obj.IsActive = doctor.IsActive ? "Kích Hoạt" : "Chưa Kích Hoạt";
                ListSearchResult.Add(obj);
            }
            DoctorSearchViewModel model = new DoctorSearchViewModel(ListSearchResult);
            model.IsActive = isActive;
            model.DoctorSearch.Name = filterText;
            return View("Search", model);
        }
    }
}
